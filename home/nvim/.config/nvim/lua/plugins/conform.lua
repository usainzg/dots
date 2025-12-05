-- [nfnl] fnl/plugins/conform.fnl
local formatters = {clojure = {"cljfmt"}, fennel = {"fnlfmt"}, javascript = {"prettierd"}, lua = {"stylua"}, nix = {"nixfmt"}, ocaml = {"ocamlformat"}, python = {"ruff"}, rust = {"rustfmt"}, typst = {"typstyle"}}
local opts = {formatters_by_ft = formatters, format_on_save = {timeout_ms = 500, lsp_fallback = true}}
return {"stevearc/conform.nvim", event = {"BufWritePre"}, cmd = {"ConformInfo"}, keys = {"<leader>cf"}, opts = opts}
