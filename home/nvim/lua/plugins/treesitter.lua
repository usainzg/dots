-- [nfnl] fnl/plugins/treesitter.fnl
local langs = {"bash", "c", "clojure", "comment", "css", "csv", "diff", "dockerfile", "ebnf", "elixir", "elm", "erlang", "fennel", "fish", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "gleam", "haskell", "hlsl", "html", "ini", "java", "javascript", "jq", "jsdoc", "json", "julia", "lalrpop", "latex", "lua", "luadoc", "make", "markdown", "markdown_inline", "ocaml", "ocaml_interface", "ocamllex", "python", "rust", "scheme", "sql", "toml", "typescript", "vim", "vimdoc", "wgsl", "wgsl_bevy", "xml", "yaml", "zig"}
local opts = {ensure_installed = langs, highlight = {enable = true}, index = {enable = true}, auto_install = false}
local function config()
  local ts = require("nvim-treesitter.configs")
  local compat = require("core.compat")
  ts.setup(opts)
  return compat["load-jabber-parser"]()
end
return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "BufRead", config = config}
