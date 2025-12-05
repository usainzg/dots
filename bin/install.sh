set +e

# INFO: Install general packages
sudo dnf install starship fzf curl nodejs npm python3 git kitty bat nvim tmux fastfetch fd ripgrep git-delta helix

# INFO: C++ Dev
sudo dnf install ccache cmake lld

# INFO: Install omzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# INFO: Install atuin
yes | curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# INFO: Install starship
yes | curl -sS https://starship.rs/install.sh | sh

# INFO: Install rust
yes | curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
