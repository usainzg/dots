-- [nfnl] fnl/lib/system.fnl
local string = require("lib.string")
local function hostname()
  return vim.fn.hostname()
end
local function hostname_prefix()
  return string.prefix(hostname(), ".")
end
local function hostname_domain()
  return string.suffix(hostname(), ".")
end
local OS = {MACOS = {}, LINUX = {}, WINDOWS = {}}
local function _1_()
  return "MacOS"
end
setmetatable(OS.MACOS, {__tostring = _1_})
local function _2_()
  return "Linux"
end
setmetatable(OS.LINUX, {__tostring = _2_})
local function _3_()
  return "Windows"
end
setmetatable(OS.WINDOWS, {__tostring = _3_})
local function os()
  local _4_ = vim.uv.os_uname().sysname
  if (_4_ == "Darwin") then
    return OS.MACOS
  elseif (_4_ == "Linux") then
    return OS.LINUX
  elseif (_4_ == "Windows") then
    return OS.WINDOWS
  elseif (_4_ == "Windows_NT") then
    return OS.WINDOWS
  else
    return nil
  end
end
local function macos_3f()
  return (os() == OS.MACOS)
end
local function linux_3f()
  return (os() == OS.LINUX)
end
local function windows_3f()
  return (os() == OS.WINDOWS)
end
local function os_name()
  return tostring(os())
end
local function env_set_3f(name)
  _G.assert((nil ~= name), "Missing argument name on /home/usainzg/.config/nvim/fnl/lib/system.fnl:47")
  local _7_
  do
    local t_6_ = vim.env
    if (nil ~= t_6_) then
      t_6_ = t_6_[name]
    else
    end
    _7_ = t_6_
  end
  return (nil ~= _7_)
end
local function env_var(name)
  _G.assert((nil ~= name), "Missing argument name on /home/usainzg/.config/nvim/fnl/lib/system.fnl:51")
  local t_9_ = vim.env
  if (nil ~= t_9_) then
    t_9_ = t_9_[name]
  else
  end
  return t_9_
end
local function run_cmd(cmd, _3fopts, _3fon_exit)
  _G.assert((nil ~= cmd), "Missing argument cmd on /home/usainzg/.config/nvim/fnl/lib/system.fnl:55")
  return vim.system(cmd, _3fopts, _3fon_exit)
end
local function run_cmd_sync(cmd, _3fopts, _3fon_exit)
  _G.assert((nil ~= cmd), "Missing argument cmd on /home/usainzg/.config/nvim/fnl/lib/system.fnl:59")
  local res = vim.system(cmd, _3fopts, _3fon_exit):wait()
  return (res.code == 0), res.stdout, res.stderr
end
return {["env-set?"] = env_set_3f, hostname = hostname, ["hostname-prefix"] = hostname_prefix, ["hostname-domain"] = hostname_domain, OS = OS, os = os, ["os-name"] = os_name, ["macos?"] = macos_3f, ["linux?"] = linux_3f, ["windows?"] = windows_3f, ["env-var"] = env_var, ["run-cmd"] = run_cmd, ["run-cmd-sync"] = run_cmd_sync}
