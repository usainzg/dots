-- [nfnl] fnl/plugins/which-key.fnl
local function _1_()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  return nil
end
return {"folke/which-key.nvim", priority = 1000, init = _1_, opts = {win = {border = "none"}, icons = {mappings = false}}, lazy = false}
