;; mason-org/mason.nvim --- package manager for language tooling

{1 :mason-org/mason-lspconfig.nvim
 ; :enabled #((. (require :lib.system) :windows?))
 :enabled #((. (require :lib.system) :linux?))
 :opts {}
 :dependencies [{1 :mason-org/mason.nvim :opts {}} :neovim/nvim-lspconfig]}
