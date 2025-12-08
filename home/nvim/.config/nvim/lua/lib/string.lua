-- [nfnl] fnl/lib/string.fnl
local function split_at(str, sep)
  if (nil == sep) then
    _G.error("Missing argument sep on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/string.fnl:3", 2)
  else
  end
  if (nil == str) then
    _G.error("Missing argument str on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/string.fnl:3", 2)
  else
  end
  local index = string.find(str, sep, 1, "plain")
  if (nil == index) then
    return nil
  else
    return {prefix = string.sub(str, 1, (index - 1)), sep = sep, suffix = string.sub(str, (index + #sep))}
  end
end
local function prefix(str, sep)
  if (nil == sep) then
    _G.error("Missing argument sep on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/string.fnl:11", 2)
  else
  end
  if (nil == str) then
    _G.error("Missing argument str on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/string.fnl:11", 2)
  else
  end
  local _7_
  do
    local t_6_ = split_at(str, sep)
    if (nil ~= t_6_) then
      t_6_ = t_6_.prefix
    else
    end
    _7_ = t_6_
  end
  return (_7_ or str)
end
local function suffix(str, sep)
  if (nil == sep) then
    _G.error("Missing argument sep on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/string.fnl:15", 2)
  else
  end
  if (nil == str) then
    _G.error("Missing argument str on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/string.fnl:15", 2)
  else
  end
  local t_11_ = split_at(str, sep)
  if (nil ~= t_11_) then
    t_11_ = t_11_.suffix
  else
  end
  return t_11_
end
return {["split-at"] = split_at, prefix = prefix, suffix = suffix}
