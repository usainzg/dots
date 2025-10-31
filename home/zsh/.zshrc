export OS="$(uname | tr '[:upper:]' '[:lower:]')"

# export LC_ALL=es_ES.UTF-8
# export LANG=es_ES.UTF-8

function __is_available {
  prog="${1}"
  os="${2}"

  if [ "${os}" != "" ] && [ "${os}" != "${OS}" ]
  then
    return 1
  fi

  type "${prog}" > /dev/null
  return "$?"
}

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# include personal paths and cargo
export PATH="$HOME/Scripts:$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.atuin/bin:$PATH" # remove?

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="hx"
export VISUAL="$EDITOR"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DOWNLOAD_DIR="${HOME}/Downloads"
export XDG_DESKTOP_DIR="${HOME}/Desktop"
export XDG_DOCUMENTS_DIR="${HOME}/Documents"
# export XDG_MUSIC_DIR="${HOME}/cloud/music"
# export XDG_PICTURES_DIR="${HOME}/cloud/photos"
# export XDG_VIDEOS_DIR="${HOME}/cloud/videos"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ Ghostty                                                                    ║
# ╚════════════════════════════════════════════════════════════════════════════╝
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
  builtin source \
    "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

# pacman stuff

# useful aliases
alias n='nvim'
alias nvim-lazy='NVIM_APPNAME="nvim-lazy" nvim'
alias nl='nvim-lazy'
alias gti='git'
alias lzg='lazygit'
alias rmrf='rm -rf'
alias ehco=echo
alias tailall='tail -f $(find /var/log -type f | grep -v '.gz$')'
alias my-ip="curl http://ipecho.net/plain; echo"

# jujutsu stuff
alias j="jj"
alias jjj="jj"
alias jn="jj new"
alias jg="jj git"
alias jp="jj git push"
alias js="jj st"


# https://github.com/ajeetdsouza/zoxide
__is_available zoxide \
&& [ "${USER}" != "root" ] \
&& eval "$(zoxide init --cmd cd zsh)" \
&& alias cdd=cdi

# https://github.com/sharkdp/bat
__is_available bat \
&& alias cat=bat

# https://github.com/aristocratos/btop
__is_available btop \
&& alias top='btop'

# https://github.com/eza-community/eza
__is_available eza \
&& alias ls='eza  --time-style=relative --git --octal-permissions --icons \
  --color=auto --binary -lg' \
&& alias ll='eza  --time-style=long-iso --git --octal-permissions --icons \
  --color=auto --binary -la' \
&& alias la='eza  --time-style=long-iso --git --octal-permissions         \
  --color=auto --binary --changed -lahHgnuU' \
&& alias l='eza   --time-style=long-iso --git                     --icons \
  --color=auto --binary -l --no-time' \
&& alias lls='eza --time-style=long-iso --git --octal-permissions --icons \
  --color=auto --binary -las modified' \
&& alias l1='eza  -1 --icons=never --color=auto'

# https://github.com/junegunn/fzf
__is_available fzf \
&& alias preview='fzf --preview="bat {} --color=always"'

# todo.txt
alias todo="hx /home/usainzg/Projects/null-pointers/todo.txt"
alias t="bat /home/usainzg/Projects/null-pointers/todo.txt"

# fzf + shell + systemd
# see: https://silverrainz.me/blog/2025-09-systemd-fzf-aliases.html
alias s='sudo systemctl'
alias sj='journalctl'
alias u='systemctl --user'
alias uj='journalctl --user'

# SystemD unit selector.
_sysls() {
    WIDE=$1
    [ -n "$2" ] && STATE="--state=$2"
    cat \
        <(echo 'UNIT/FILE LOAD/STATE ACTIVE/PRESET SUB DESCRIPTION') \
        <(systemctl $WIDE list-units --quiet $STATE) \
        <(systemctl $WIDE list-unit-files --quiet $STATE) \
    | sed 's/●/ /' \
    | grep . \
    | column --table --table-columns-limit=5 \
    | fzf --header-lines=1 \
          --accept-nth=1 \
          --no-hscroll \
          --preview="SYSTEMD_COLORS=1 systemctl $WIDE status {1}" \
          --preview-window=down
}

alias sls='_sysls --system'
alias uls='_sysls --user'

_SYS_ALIASES=(
    sstart sstop sre
    ustart ustop ure
)
_SYS_CMDS=(
    's start $(sls static,disabled,failed)'
    's stop $(sls running,failed)'
    's restart $(sls)'
    'u start $(uls static,disabled,failed)'
    'u stop $(uls running,failed)'
    'u restart $(uls)'
)

_sysexec() {
    for ((j=0; j < ${#_SYS_ALIASES[@]}; j++)); do
        if [ "$1" == "${_SYS_ALIASES[$j]}" ]; then
            cmd=$(eval echo "${_SYS_CMDS[$j]}") # expand service name
            wide=${cmd:0:1}
            cmd="$cmd && ${wide} status \$_ || ${wide}j -xeu \$_"
            eval $cmd

            # Push to history.
            [ -n "$BASH_VERSION" ] && history -s $cmd
            [ -n "$ZSH_VERSION" ] && print -s $cmd
            return
        fi
    done
}

# Generate bash function/zsh widgets.
for i in ${_SYS_ALIASES[@]}; do
    source /dev/stdin <<EOF
$i() {
    _sysexec $i
}
EOF
done

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

. "$HOME/.cargo/env"
. "$HOME/.atuin/bin/env"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/usainzg/.opam/opam-init/init.zsh' ]] || source '/home/usainzg/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# add zig
export PATH="$HOME/zig/zig-x86_64-linux-0.15.2/:$PATH"

eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(starship init zsh)"
