-- [nfnl] fnl/lib/version.fnl
local mt = {__le = vim.version.le, __lt = vim.version.lt, __eq = vim.version.eq}
local function make(version)
  _G.assert((nil ~= version), "Missing argument version on /home/usainzg/.config/nvim/fnl/lib/version.fnl:5")
  setmetatable(version, mt)
  version["cmp"] = vim.version.cmp
  version["le"] = vim.version.le
  version["lt"] = vim.version.lt
  version["ge"] = vim.version.ge
  version["gt"] = vim.version.gt
  return version
end
local function nvim()
  return make(vim.version())
end
local function parse(version, _3fopts)
  _G.assert((nil ~= version), "Missing argument version on /home/usainzg/.config/nvim/fnl/lib/version.fnl:19")
  return make(vim.version.parse(version, _3fopts))
end
local function parse_2a(version, _3fopts)
  _G.assert((nil ~= version), "Missing argument version on /home/usainzg/.config/nvim/fnl/lib/version.fnl:23")
  if (getmetatable(version) ~= mt) then
    return parse(version, _3fopts)
  else
    return version
  end
end
local function cmp(lhs, rhs)
  _G.assert((nil ~= rhs), "Missing argument rhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:27")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:27")
  local lhs0 = parse_2a(lhs)
  local rhs0 = parse_2a(rhs)
  return lhs0:cmp(rhs0)
end
local function eq(lhs, rhs)
  _G.assert((nil ~= rhs), "Missing argument rhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:33")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:33")
  return (cmp(lhs, rhs) == 0)
end
local function le(lhs, rhs)
  _G.assert((nil ~= rhs), "Missing argument rhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:36")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:36")
  return (cmp(lhs, rhs) ~= 1)
end
local function lt(lhs, rhs)
  _G.assert((nil ~= rhs), "Missing argument rhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:39")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:39")
  return (cmp(lhs, rhs) == -1)
end
local function ge(lhs, rhs)
  _G.assert((nil ~= rhs), "Missing argument rhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:42")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:42")
  return not lt(lhs, rhs)
end
local function gt(lhs, rhs)
  _G.assert((nil ~= rhs), "Missing argument rhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:45")
  _G.assert((nil ~= lhs), "Missing argument lhs on /home/usainzg/.config/nvim/fnl/lib/version.fnl:45")
  return not le(lhs, rhs)
end
return {cmp = cmp, eq = eq, ge = ge, gt = gt, le = le, lt = lt, make = make, nvim = nvim, parse = parse, ["parse*"] = parse_2a, range = vim.version.range}
