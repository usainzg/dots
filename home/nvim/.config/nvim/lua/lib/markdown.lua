-- [nfnl] fnl/lib/markdown.fnl
local checked_pattern = "%[x%]"
local unchecked_pattern = "%[ %]"
local function line_contains_checked(line)
  if (nil == line) then
    _G.error("Missing argument line on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/markdown.fnl:6", 2)
  else
  end
  return (line:find(checked_pattern) ~= nil)
end
local function line_contains_unchecked(line)
  if (nil == line) then
    _G.error("Missing argument line on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/markdown.fnl:10", 2)
  else
  end
  return (line:find(unchecked_pattern) ~= nil)
end
local function check(line)
  if (nil == line) then
    _G.error("Missing argument line on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/markdown.fnl:14", 2)
  else
  end
  local line0, success = line:gsub(unchecked_pattern, checked_pattern, 1)
  local success0
  if (success == 1) then
    success0 = true
  else
    success0 = false
  end
  return {line = line0, success = success0}
end
local function uncheck(line)
  if (nil == line) then
    _G.error("Missing argument line on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/markdown.fnl:20", 2)
  else
  end
  local line0, success = line:gsub(checked_pattern, unchecked_pattern, 1)
  local success0
  if (success == 1) then
    success0 = true
  else
    success0 = false
  end
  return {line = line0, success = success0}
end
local function toggle_check(line)
  if (nil == line) then
    _G.error("Missing argument line on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/markdown.fnl:26", 2)
  else
  end
  if line_contains_unchecked(line) then
    return check(line)
  elseif line_contains_checked(line) then
    return uncheck(line)
  else
    return {line = line, success = false}
  end
end
local function toggle_check_on_cursor_line()
  local buf = vim.api.nvim_buf_get_number(0)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_line = (cursor[1] - 1)
  local current_line = (vim.api.nvim_buf_get_lines(buf, cursor_line, (cursor_line + 1), false)[1] or "")
  local _let_9_ = toggle_check(current_line)
  local line = _let_9_.line
  local success = _let_9_.success
  if success then
    vim.api.nvim_buf_set_lines(buf, cursor_line, (cursor_line + 1), false, {line})
    vim.api.nvim_win_set_cursor(0, cursor)
    return nil
  else
    return nil
  end
end
return {["checked-pattern"] = checked_pattern, ["unchecked-pattern"] = unchecked_pattern, ["line-contains-checked"] = line_contains_checked, ["line-contains-unchecked"] = line_contains_unchecked, check = check, uncheck = uncheck, ["toggle-check"] = toggle_check, ["toggle-check-on-cursor-line"] = toggle_check_on_cursor_line}
