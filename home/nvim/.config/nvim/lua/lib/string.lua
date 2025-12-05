-- [nfnl] fnl/lib/string.fnl
local function split_at(str, sep)
  _G.assert((nil ~= sep), "Missing argument sep on /home/usainzg/.config/nvim/fnl/lib/string.fnl:3")
  _G.assert((nil ~= str), "Missing argument str on /home/usainzg/.config/nvim/fnl/lib/string.fnl:3")
  local index = string.find(str, sep, 1, "plain")
  if (nil == index) then
    return nil
  else
    return {prefix = string.sub(str, 1, (index - 1)), sep = sep, suffix = string.sub(str, (index + #sep))}
  end
end
local function prefix(str, sep)
  _G.assert((nil ~= sep), "Missing argument sep on /home/usainzg/.config/nvim/fnl/lib/string.fnl:11")
  _G.assert((nil ~= str), "Missing argument str on /home/usainzg/.config/nvim/fnl/lib/string.fnl:11")
  local _3_
  do
    local t_2_ = split_at(str, sep)
    if (nil ~= t_2_) then
      t_2_ = t_2_.prefix
    else
    end
    _3_ = t_2_
  end
  return (_3_ or str)
end
local function suffix(str, sep)
  _G.assert((nil ~= sep), "Missing argument sep on /home/usainzg/.config/nvim/fnl/lib/string.fnl:15")
  _G.assert((nil ~= str), "Missing argument str on /home/usainzg/.config/nvim/fnl/lib/string.fnl:15")
  local t_5_ = split_at(str, sep)
  if (nil ~= t_5_) then
    t_5_ = t_5_.suffix
  else
  end
  return t_5_
end
return {["split-at"] = split_at, prefix = prefix, suffix = suffix}
