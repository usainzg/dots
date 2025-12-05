-- [nfnl] fnl/plugins/neotest.fnl
local function opts()
  return {adapters = {require("rustaceanvim.neotest")}}
end
return {"nvim-neotest/neotest", dependencies = {"nvim-neotest/nvim-nio", "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim", "nvim-treesitter/nvim-treesitter", "rustaceanvim"}, opts = opts, lazy = true}
