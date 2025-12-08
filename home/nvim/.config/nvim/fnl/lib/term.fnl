;; utilities for inspecting the terminal environment

(local system (require :lib.system))

(λ windows-terminal? []
  "Returns `true` if the current terminal program is Windows Terminal."
  (system.env-set? :WT_SESSION))

(λ ghostty? []
  "Returns `(= :ghostty vim.env.TERM_PROGRAM)`."
  (= :ghostty vim.env.TERM_PROGRAM))

(λ wezterm? []
  "Returns `(= :Wezterm vim.env.TERM_PROGRAM)`."
  (= :WezTerm vim.env.TERM_PROGRAM))

(λ alacritty? []
  "Returns `(= :alacritty vim.env.TERM)`."
  (= :alacritty vim.env.TERM))

(λ kitty? []
  "Returns `(= :kitty vim.env.TERM_PROGRAM)`."
  (= :kitty vim.env.TERM_PROGRAM))

(λ neovide? []
  "Returns `true` if `vim.g.neovide` is set, and `false` otherwise."
  (if (?. vim.g.neovide) true false))

;; enum of recognised terminal emulators
(local TERM {:ALACRITTY {}
             :GHOSTTY {}
             :KITTY {}
             :NEOVIDE {}
             :WEZTERM {}
             :WINTERM {}
             :UNKNOWN {}})

(setmetatable TERM.ALACRITTY {:__tostring #:Alacritty})
(setmetatable TERM.GHOSTTY {:__tostring #:Ghostty})
(setmetatable TERM.KITTY {:__tostring #:Kitty})
(setmetatable TERM.NEOVIDE {:__tostring #:Neovide})
(setmetatable TERM.WEZTERM {:__tostring #:WezTerm})
(setmetatable TERM.WINTERM {:__tostring #"Windows Terminal"})
(setmetatable TERM.UNKNOWN {:__tostring #:unknown})

(λ program []
  "Returns a `lib.term.TERM` value corresponding to the current terminal program."
  (if (alacritty?) TERM.ALACRITTY
      (ghostty?) TERM.GHOSTTY
      (kitty?) TERM.KITTY
      (neovide?) TERM.NEOVIDE
      (wezterm?) TERM.WEZTERM
      (windows-terminal?) TERM.WINTERM
      TERM.UNKNOWN))

(λ program-name []
  "Returns the canonical name of the current terminal program."
  (tostring (program)))

;; return public interface
{: TERM
 : program
 : program-name
 : wezterm?
 : alacritty?
 : ghostty?
 : kitty?
 : neovide?
 : windows-terminal?}
