-- [nfnl] fnl/lib/keymap.fnl
local wk = require("which-key")
local function group(lhs, name, _3fbuffer)
  _G.assert((nil ~= name), "Missing argument name on /home/usainzg/.config/nvim/fnl/lib/keymap.fnl:5")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/keymap.fnl:5")
  return wk.add({lhs, group = name, buffer = _3fbuffer})
end
local function map(lhs, rhs, desc, _3fmode, _3fbuffer)
  _G.assert((nil ~= desc), "Missing argument desc on /home/usainzg/.config/nvim/fnl/lib/keymap.fnl:9")
  _G.assert((nil ~= rhs), "Missing argument rhs on /home/usainzg/.config/nvim/fnl/lib/keymap.fnl:9")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/keymap.fnl:9")
  return wk.add({lhs, rhs, desc = desc, mode = (_3fmode or "n"), buffer = _3fbuffer})
end
local function slot(lhs, desc, _3fmode)
  _G.assert((nil ~= desc), "Missing argument desc on /home/usainzg/.config/nvim/fnl/lib/keymap.fnl:13")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/keymap.fnl:13")
  return wk.add({lhs, desc = desc, mode = (_3fmode or "n")})
end
return {group = group, map = map, slot = slot}
