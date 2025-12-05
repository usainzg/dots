-- [nfnl] fnl/plugins/alabaster.fnl
local function _1_(_)
  vim.g.alabaster_dim_comments = false
  return nil
end
return {"p00f/alabaster.nvim", init = _1_}
