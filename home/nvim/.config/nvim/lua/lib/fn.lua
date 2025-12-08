-- [nfnl] fnl/lib/fn.fnl
local function const(x)
  if (nil == x) then
    _G.error("Missing argument x on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/fn.fnl:3", 2)
  else
  end
  local function _2_()
    return x
  end
  return _2_
end
local function id(x)
  if (nil == x) then
    _G.error("Missing argument x on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/fn.fnl:7", 2)
  else
  end
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
