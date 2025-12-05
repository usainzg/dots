-- [nfnl] fnl/core/options.fnl
local function setup(_self)
  vim.opt["backspace"] = "2"
  vim.opt["laststatus"] = 2
  vim.opt["showcmd"] = true
  vim.opt["autoread"] = true
  vim.opt["tabstop"] = 4
  vim.opt["softtabstop"] = 4
  vim.opt["shiftwidth"] = 2
  vim.opt["shiftround"] = true
  vim.opt["expandtab"] = true
  vim.opt["timeoutlen"] = 500
  vim.opt["updatetime"] = 250
  vim.opt["conceallevel"] = 0
  vim.opt["scrolloff"] = 3
  vim.opt["number"] = true
  vim.opt["relativenumber"] = false
  vim.opt["wrap"] = true
  vim.opt["termguicolors"] = true
  vim.opt["foldmethod"] = "expr"
  vim.opt["foldexpr"] = "v:lua.vim.treesitter.foldexpr()"
  vim.opt["foldcolumn"] = "0"
  vim.opt["foldlevel"] = 99
  vim.opt["foldlevelstart"] = 99
  vim.opt["foldnestmax"] = 4
  vim.opt["clipboard"] = "unnamedplus"
  vim.opt["ignorecase"] = true
  vim.opt["smartcase"] = true
  vim.opt["hlsearch"] = true
  vim.opt["grepprg"] = "rg --vimgrep"
  vim.opt["grepformat"] = "%f:%1:%c:%m"
  vim.opt["path"] = {".", "**"}
  vim.opt["history"] = 1000
  vim.opt["backup"] = false
  vim.opt["writebackup"] = false
  vim.opt["undofile"] = true
  vim.opt["swapfile"] = false
  vim.opt["splitbelow"] = true
  vim.opt["splitright"] = true
  vim.opt["sidescroll"] = 5
  vim.opt["splitkeep"] = "screen"
  vim.opt["signcolumn"] = "auto"
  return nil
end
return {setup = setup}
