-- [nfnl] fnl/core/neovide.fnl
local function setup(_self)
  local system = require("lib.system")
  do
    local case_1_ = system.os()
    if (case_1_ == system.OS.WINDOWS) then
      vim.opt.guifont = "Berkeley Mono:h14"
    elseif (case_1_ == system.OS.MACOS) then
      vim.opt.guifont = "BerkeleyMono Nerd Font:h14:#e-subpixelantialias"
    else
      local _ = case_1_
      vim.opt.guifont = ""
    end
  end
  vim.g.neovide_text_gamma = 0.6
  vim.g.neovide_text_contrast = 0.1
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 10
  vim.g.neovide_padding_right = 10
  vim.g.neovide_padding_left = 10
  vim.g.neovide_cursor_animation_length = 0.025
  vim.g.neovide_cursor_trail_size = 0.2
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_theme = "light"
  return nil
end
return {setup = setup}
