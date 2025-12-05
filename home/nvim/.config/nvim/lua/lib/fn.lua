-- [nfnl] fnl/lib/fn.fnl
local function const(x)
  _G.assert((nil ~= x), "Missing argument x on /home/usainzg/.config/nvim/fnl/lib/fn.fnl:3")
  local function _1_()
    return x
  end
  return _1_
end
local function id(x)
  _G.assert((nil ~= x), "Missing argument x on /home/usainzg/.config/nvim/fnl/lib/fn.fnl:7")
  return x
end
local function run_21(_3ff)
  if _3ff then
    return _3ff()
  else
    return nil
  end
end
local function ignore(_3ff)
  run_21(_3ff)
  return nil
end
return {const = const, id = id, ignore = ignore, ["run!"] = run_21}
