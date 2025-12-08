-- [nfnl] fnl/plugins/rustaceanvim.fnl
local function run_tests_in_file()
  return require("neotest").run.run(_G.vim.fn.expand("%"))
end
local function make_bindings()
  local _let_1_ = require("lib.keymap")
  local map = _let_1_.map
  local buffer = vim.api.nvim_get_current_buf()
  local function _2_()
    return vim.cmd.RustLsp("codeAction")
  end
  map("<leader>ca", _2_, "Code actions", "n", buffer)
  local function _3_()
    return vim.cmd.RustLsp("run")
  end
  map("<leader>cx", _3_, "Execute item", "n", buffer)
  return map("<leader>ct", run_tests_in_file, "Test file", "n", buffer)
end
local rust_analyzer
do
  local show_item_count = 16
  rust_analyzer = {cargo = {features = "all"}, completion = {callable = {snippets = "none"}}, check = {command = "clippy", features = "all"}, hover = {actions = {enable = true, references = {enable = true}}, memoryLayout = {niches = true, size = "hexadecimal", alignment = "hexadecimal", padding = "hexadecimal"}, show = {enumVariants = show_item_count, fields = show_item_count, traitAssocItems = show_item_count}}, procMacro = {enable = true, attributes = {enable = true}}}
end
local function _4_()
  return {server = {on_attach = make_bindings, default_settings = {["rust-analyzer"] = rust_analyzer}}}
end
vim.g.rustaceanvim = _4_
return {"mrcjkb/rustaceanvim", version = "^6", lazy = false}
