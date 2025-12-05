-- [nfnl] fnl/plugins/octo.fnl
local function _1_()
  return require("octo").setup()
end
return {"pwntester/octo.nvim", cmd = {"Octo"}, config = _1_, dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons"}}
