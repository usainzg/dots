-- [nfnl] fnl/plugins/oil.fnl
local opts
local function _1_(name, _bufnr)
  return ((name == ".git") or (name == ".."))
end
opts = {view_options = {show_hidden = true, is_always_hidden = _1_}, keymaps = {L = "actions.select", H = "actions.parent"}}
return {"stevearc/oil.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = opts}
