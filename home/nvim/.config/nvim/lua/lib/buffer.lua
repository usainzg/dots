-- [nfnl] fnl/lib/buffer.fnl
local function create(_3fopts)
  local listed
  local _2_
  do
    local t_1_ = _3fopts
    if (nil ~= t_1_) then
      t_1_ = t_1_.listed
    else
    end
    _2_ = t_1_
  end
  listed = (_2_ or false)
  local scratch
  local _5_
  do
    local t_4_ = _3fopts
    if (nil ~= t_4_) then
      t_4_ = t_4_.scratch
    else
    end
    _5_ = t_4_
  end
  scratch = (_5_ or false)
  local buf = vim.api.nvim_create_buf(listed, scratch)
  if (buf ~= 0) then
    return buf
  else
    return nil
  end
end
local function open(buf, _3fafter)
  if (nil == buf) then
    _G.error("Missing argument buf on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:10", 2)
  else
  end
  vim.api.nvim_win_set_buf(0, buf)
  if _3fafter then
    _3fafter(buf)
  else
  end
  return buf
end
local function rename_21(buf, name)
  if (nil == name) then
    _G.error("Missing argument name on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:16", 2)
  else
  end
  if (nil == buf) then
    _G.error("Missing argument buf on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:16", 2)
  else
  end
  vim.api.nvim_buf_set_name(buf, name)
  return nil
end
local function set_21(buf, name, value)
  if (nil == value) then
    _G.error("Missing argument value on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:21", 2)
  else
  end
  if (nil == name) then
    _G.error("Missing argument name on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:21", 2)
  else
  end
  if (nil == buf) then
    _G.error("Missing argument buf on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:21", 2)
  else
  end
  vim.api.nvim_set_option_value(name, value, {buf = buf})
  return nil
end
local function set_lines_21(buf, start, _end, lines, _3fopts)
  if (nil == lines) then
    _G.error("Missing argument lines on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:26", 2)
  else
  end
  if (nil == _end) then
    _G.error("Missing argument end on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:26", 2)
  else
  end
  if (nil == start) then
    _G.error("Missing argument start on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:26", 2)
  else
  end
  if (nil == buf) then
    _G.error("Missing argument buf on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/buffer.fnl:26", 2)
  else
  end
  local strict
  local _20_
  do
    local t_19_ = _3fopts
    if (nil ~= t_19_) then
      t_19_ = t_19_.strict_indexing
    else
    end
    _20_ = t_19_
  end
  strict = (_20_ or false)
  return vim.api.nvim_buf_set_lines(buf, start, _end, strict, lines)
end
return {create = create, open = open, ["rename!"] = rename_21, ["set!"] = set_21, ["set-lines!"] = set_lines_21}
