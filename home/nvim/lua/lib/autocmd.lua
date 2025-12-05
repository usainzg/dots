-- [nfnl] fnl/lib/autocmd.fnl
local function group(name, _3fclear)
  _G.assert((nil ~= name), "Missing argument name on /home/usainzg/.config/nvim/fnl/lib/autocmd.fnl:3")
  local _1_
  if (_3fclear == "clear") then
    _1_ = true
  elseif (_3fclear == "noclear") then
    _1_ = false
  else
    local _ = _3fclear
    _1_ = nil
  end
  return vim.api.nvim_create_augroup(name, {clear = _1_})
end
local function create(event, pattern, action, _3fgroup)
  _G.assert((nil ~= action), "Missing argument action on /home/usainzg/.config/nvim/fnl/lib/autocmd.fnl:11")
  _G.assert((nil ~= pattern), "Missing argument pattern on /home/usainzg/.config/nvim/fnl/lib/autocmd.fnl:11")
  _G.assert((nil ~= event), "Missing argument event on /home/usainzg/.config/nvim/fnl/lib/autocmd.fnl:11")
  local _7_
  do
    local _6_ = type(action)
    if (_6_ == "string") then
      _7_ = "command"
    elseif (_6_ == "function") then
      _7_ = "callback"
    else
      _7_ = nil
    end
  end
  vim.api.nvim_create_autocmd(event, {pattern = pattern, group = _3fgroup, [_7_] = action})
  return _3fgroup
end
local function create_once(event, pattern, action, _3fgroup)
  _G.assert((nil ~= action), "Missing argument action on /home/usainzg/.config/nvim/fnl/lib/autocmd.fnl:21")
  _G.assert((nil ~= pattern), "Missing argument pattern on /home/usainzg/.config/nvim/fnl/lib/autocmd.fnl:21")
  _G.assert((nil ~= event), "Missing argument event on /home/usainzg/.config/nvim/fnl/lib/autocmd.fnl:21")
  local _12_
  do
    local _11_ = type(action)
    if (_11_ == "string") then
      _12_ = "command"
    elseif (_11_ == "function") then
      _12_ = "callback"
    else
      _12_ = nil
    end
  end
  vim.api.nvim_create_autocmd(event, {pattern = pattern, group = _3fgroup, once = true, [_12_] = action})
  return _3fgroup
end
return {group = group, create = create, ["create-once"] = create_once}
