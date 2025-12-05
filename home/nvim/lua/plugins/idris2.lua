-- [nfnl] fnl/plugins/idris2.fnl
local function on_attach(_client)
  local _let_1_ = require("lib.keymap")
  local map = _let_1_["map"]
  local group = _let_1_["group"]
  local bufnr = vim.api.nvim_get_current_buf()
  local action = require("idris2.code_action")
  local repl = require("idris2.repl")
  local metavar = require("idris2.metavars")
  group("<leader>p", "+proof", bufnr)
  map("<leader>pd", action.add_clause, "Add declaration clause", "n", bufnr)
  map("<leader>pe", repl.evaluate, "Evaluate expression", "n", bufnr)
  map("<leader>pg", action.generate_def, "Generate definition", "n", bufnr)
  map("<leader>pr", action.refine_hole, "Refine hole", "n", bufnr)
  map("<leader>pR", action.expr_search_hints, "Refine hole with names", "n", bufnr)
  map("<leader>ps", action.case_split, "Case split", "n", bufnr)
  map("<leader>p]", metavar.goto_next, "Next metavar", "n", bufnr)
  map("<leader>p[", metavar.goto_prev, "Previous metavar", "n", bufnr)
  group("<leader>pm", "+metavar", bufnr)
  map("<leader>pmc", action.make_case, "Replace metavar with case block", "n", bufnr)
  map("<leader>pmf", action.expr_search, "Fill metavar", "n", bufnr)
  map("<leader>pmF", action.intro, "Fill metavar with constructors", "n", bufnr)
  map("<leader>pml", action.make_lemma, "Replace metavar with lemma block", "n", bufnr)
  map("<leader>pmm", metavar.request_all, "Show metavars", "n", bufnr)
  return map("<leader>pmw", action.make_with, "Replace metavar with with block", "n", bufnr)
end
local opts
local function _2_()
  return vim.cmd("silent write")
end
opts = {autostart_semantic = true, code_action_post_hook = _2_, server = {on_attach = on_attach}}
local function _3_()
  local idris2 = require("idris2")
  return idris2.setup(opts)
end
return {"idris-community/idris2-nvim", dependencies = {"neovim/nvim-lspconfig", "MunifTanjim/nui.nvim"}, ft = {"idris2", "ipkg"}, config = _3_}
