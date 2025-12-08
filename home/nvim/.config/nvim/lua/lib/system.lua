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
  local case_4_ = vim.uv.os_uname().sysname
  if (case_4_ == "Darwin") then
    return OS.MACOS
  elseif (case_4_ == "Linux") then
    return OS.LINUX
  elseif (case_4_ == "Windows") then
    return OS.WINDOWS
  elseif (case_4_ == "Windows_NT") then
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
  if (nil == name) then
    _G.error("Missing argument name on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/system.fnl:47", 2)
  else
  end
  local _8_
  do
    local t_7_ = vim.env
    if (nil ~= t_7_) then
      t_7_ = t_7_[name]
    else
    end
    _8_ = t_7_
  end
  return (nil ~= _8_)
end
local function env_var(name)
  if (nil == name) then
    _G.error("Missing argument name on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/system.fnl:51", 2)
  else
  end
  local t_11_ = vim.env
  if (nil ~= t_11_) then
    t_11_ = t_11_[name]
  else
  end
  return t_11_
end
local function run_cmd(cmd, _3fopts, _3fon_exit)
  if (nil == cmd) then
    _G.error("Missing argument cmd on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/system.fnl:55", 2)
  else
  end
  return vim.system(cmd, _3fopts, _3fon_exit)
end
local function run_cmd_sync(cmd, _3fopts, _3fon_exit)
  if (nil == cmd) then
    _G.error("Missing argument cmd on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/system.fnl:59", 2)
  else
  end
  local res = vim.system(cmd, _3fopts, _3fon_exit):wait()
  return (res.code == 0), res.stdout, res.stderr
end
return {["env-set?"] = env_set_3f, hostname = hostname, ["hostname-prefix"] = hostname_prefix, ["hostname-domain"] = hostname_domain, OS = OS, os = os, ["os-name"] = os_name, ["macos?"] = macos_3f, ["linux?"] = linux_3f, ["windows?"] = windows_3f, ["env-var"] = env_var, ["run-cmd"] = run_cmd, ["run-cmd-sync"] = run_cmd_sync}
