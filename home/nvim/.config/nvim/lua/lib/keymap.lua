-- [nfnl] fnl/lib/keymap.fnl
local wk = require("which-key")
local function group(lhs, name, _3fbuffer)
  if (nil == name) then
    _G.error("Missing argument name on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/keymap.fnl:5", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/keymap.fnl:5", 2)
  else
  end
  return wk.add({lhs, group = name, buffer = _3fbuffer})
end
local function map(lhs, rhs, desc, _3fmode, _3fbuffer)
  if (nil == desc) then
    _G.error("Missing argument desc on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/keymap.fnl:9", 2)
  else
  end
  if (nil == rhs) then
    _G.error("Missing argument rhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/keymap.fnl:9", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/keymap.fnl:9", 2)
  else
  end
  return wk.add({lhs, rhs, desc = desc, mode = (_3fmode or "n"), buffer = _3fbuffer})
end
local function slot(lhs, desc, _3fmode)
  if (nil == desc) then
    _G.error("Missing argument desc on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/keymap.fnl:13", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/keymap.fnl:13", 2)
  else
  end
  return wk.add({lhs, desc = desc, mode = (_3fmode or "n")})
end
return {group = group, map = map, slot = slot}
