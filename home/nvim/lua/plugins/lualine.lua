-- [nfnl] fnl/plugins/lualine.fnl
local function pwd()
  return vim.fn.expand("%:~:h")
end
local options = {icons_enabled = true, theme = "auto", component_separators = "|", section_separators = ""}
local sections = {lualine_a = {"mode"}, lualine_b = {"branch", "diff", "diagnostics"}, lualine_c = {"filename", pwd}, lualine_x = {}, lualine_y = {"encoding", "filetype"}, lualine_z = {"location"}}
return {"nvim-lualine/lualine.nvim", opts = {options = options, sections = sections}, event = "UiEnter"}
