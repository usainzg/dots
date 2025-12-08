-- [nfnl] fnl/lib/version.fnl
local mt = {__le = vim.version.le, __lt = vim.version.lt, __eq = vim.version.eq}
local function make(version)
  if (nil == version) then
    _G.error("Missing argument version on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:5", 2)
  else
  end
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
  if (nil == version) then
    _G.error("Missing argument version on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:19", 2)
  else
  end
  return make(vim.version.parse(version, _3fopts))
end
local function parse_2a(version, _3fopts)
  if (nil == version) then
    _G.error("Missing argument version on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:23", 2)
  else
  end
  if (getmetatable(version) ~= mt) then
    return parse(version, _3fopts)
  else
    return version
  end
end
local function cmp(lhs, rhs)
  if (nil == rhs) then
    _G.error("Missing argument rhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:27", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:27", 2)
  else
  end
  local lhs0 = parse_2a(lhs)
  local rhs0 = parse_2a(rhs)
  return lhs0:cmp(rhs0)
end
local function eq(lhs, rhs)
  if (nil == rhs) then
    _G.error("Missing argument rhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:33", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:33", 2)
  else
  end
  return (cmp(lhs, rhs) == 0)
end
local function le(lhs, rhs)
  if (nil == rhs) then
    _G.error("Missing argument rhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:36", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:36", 2)
  else
  end
  return (cmp(lhs, rhs) ~= 1)
end
local function lt(lhs, rhs)
  if (nil == rhs) then
    _G.error("Missing argument rhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:39", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:39", 2)
  else
  end
  return (cmp(lhs, rhs) == -1)
end
local function ge(lhs, rhs)
  if (nil == rhs) then
    _G.error("Missing argument rhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:42", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:42", 2)
  else
  end
  return not lt(lhs, rhs)
end
local function gt(lhs, rhs)
  if (nil == rhs) then
    _G.error("Missing argument rhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:45", 2)
  else
  end
  if (nil == lhs) then
    _G.error("Missing argument lhs on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/version.fnl:45", 2)
  else
  end
  return not le(lhs, rhs)
end
return {cmp = cmp, eq = eq, ge = ge, gt = gt, le = le, lt = lt, make = make, nvim = nvim, parse = parse, ["parse*"] = parse_2a, range = vim.version.range}
