-- [nfnl] fnl/lib/term.fnl
local system = require("lib.system")
local function windows_terminal_3f()
  return system["env-set?"]("WT_SESSION")
end
local function ghostty_3f()
  return ("ghostty" == vim.env.TERM_PROGRAM)
end
local function wezterm_3f()
  return ("WezTerm" == vim.env.TERM_PROGRAM)
end
local function alacritty_3f()
  return ("alacritty" == vim.env.TERM)
end
local function iterm2_3f()
  return ("iTerm.app" == vim.env.TERM_PROGRAM)
end
local function neovide_3f()
  local _2_
  do
    local t_1_ = vim.g.neovide
    _2_ = t_1_
  end
  if _2_ then
    return true
  else
    return false
  end
end
local TERM = {ALACRITTY = {}, GHOSTTY = {}, ITERM2 = {}, NEOVIDE = {}, WEZTERM = {}, WINTERM = {}, UNKNOWN = {}}
local function _4_()
  return "Alacritty"
end
setmetatable(TERM.ALACRITTY, {__tostring = _4_})
local function _5_()
  return "Ghostty"
end
setmetatable(TERM.GHOSTTY, {__tostring = _5_})
local function _6_()
  return "iTerm2"
end
setmetatable(TERM.ITERM2, {__tostring = _6_})
local function _7_()
  return "Neovide"
end
setmetatable(TERM.NEOVIDE, {__tostring = _7_})
local function _8_()
  return "WezTerm"
end
setmetatable(TERM.WEZTERM, {__tostring = _8_})
local function _9_()
  return "Windows Terminal"
end
setmetatable(TERM.WINTERM, {__tostring = _9_})
local function _10_()
  return "unknown"
end
setmetatable(TERM.UNKNOWN, {__tostring = _10_})
local function program()
  if alacritty_3f() then
    return TERM.ALACRITTY
  elseif ghostty_3f() then
    return TERM.GHOSTTY
  elseif iterm2_3f() then
    return TERM.ITERM2
  elseif neovide_3f() then
    return TERM.NEOVIDE
  elseif wezterm_3f() then
    return TERM.WEZTERM
  elseif windows_terminal_3f() then
    return TERM.WINTERM
  else
    return TERM.UNKNOWN
  end
end
local function program_name()
  return tostring(program())
end
return {TERM = TERM, program = program, ["program-name"] = program_name, ["wezterm?"] = wezterm_3f, ["alacritty?"] = alacritty_3f, ["ghostty?"] = ghostty_3f, ["iterm2?"] = iterm2_3f, ["neovide?"] = neovide_3f, ["windows-terminal?"] = windows_terminal_3f}
