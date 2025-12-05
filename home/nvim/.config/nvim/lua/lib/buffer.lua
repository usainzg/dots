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
  _G.assert((nil ~= buf), "Missing argument buf on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:10")
  vim.api.nvim_win_set_buf(0, buf)
  if _3fafter then
    _3fafter(buf)
  else
  end
  return buf
end
local function rename_21(buf, name)
  _G.assert((nil ~= name), "Missing argument name on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:16")
  _G.assert((nil ~= buf), "Missing argument buf on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:16")
  vim.api.nvim_buf_set_name(buf, name)
  return nil
end
local function set_21(buf, name, value)
  _G.assert((nil ~= value), "Missing argument value on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:21")
  _G.assert((nil ~= name), "Missing argument name on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:21")
  _G.assert((nil ~= buf), "Missing argument buf on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:21")
  vim.api.nvim_set_option_value(name, value, {buf = buf})
  return nil
end
local function set_lines_21(buf, start, _end, lines, _3fopts)
  _G.assert((nil ~= lines), "Missing argument lines on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:26")
  _G.assert((nil ~= _end), "Missing argument end on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:26")
  _G.assert((nil ~= start), "Missing argument start on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:26")
  _G.assert((nil ~= buf), "Missing argument buf on /home/usainzg/.config/nvim/fnl/lib/buffer.fnl:26")
  local strict
  local _10_
  do
    local t_9_ = _3fopts
    if (nil ~= t_9_) then
      t_9_ = t_9_.strict_indexing
    else
    end
    _10_ = t_9_
  end
  strict = (_10_ or false)
  return vim.api.nvim_buf_set_lines(buf, start, _end, strict, lines)
end
return {create = create, open = open, ["rename!"] = rename_21, ["set!"] = set_21, ["set-lines!"] = set_lines_21}
