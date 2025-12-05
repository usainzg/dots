-- [nfnl] fnl/plugins/mason.fnl
local function _1_()
  return require("lib.system")["windows?"]()
end
return {"mason-org/mason-lspconfig.nvim", enabled = _1_, opts = {}, dependencies = {{"mason-org/mason.nvim", opts = {}}, "neovim/nvim-lspconfig"}}
