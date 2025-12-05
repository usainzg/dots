-- [nfnl] fnl/plugins/grapple.fnl
local opts = {quick_select = "1234567890"}
return {"cbochs/grapple.nvim", opts = opts, dependencies = {{"nvim-tree/nvim-web-devicons", lazy = true}}, cmd = "Grapple", event = {"BufReadPost", "BufNewFile"}}
