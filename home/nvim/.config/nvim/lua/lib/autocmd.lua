-- [nfnl] fnl/lib/autocmd.fnl
local function group(name, _3fclear)
  if (nil == name) then
    _G.error("Missing argument name on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/autocmd.fnl:3", 2)
  else
  end
  local _2_
  if (_3fclear == "clear") then
    _2_ = true
  elseif (_3fclear == "noclear") then
    _2_ = false
  else
    local _ = _3fclear
    _2_ = nil
  end
  return vim.api.nvim_create_augroup(name, {clear = _2_})
end
local function create(event, pattern, action, _3fgroup)
  if (nil == action) then
    _G.error("Missing argument action on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/autocmd.fnl:11", 2)
  else
  end
  if (nil == pattern) then
    _G.error("Missing argument pattern on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/autocmd.fnl:11", 2)
  else
  end
  if (nil == event) then
    _G.error("Missing argument event on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/autocmd.fnl:11", 2)
  else
  end
  local _11_
  do
    local case_10_ = type(action)
    if (case_10_ == "string") then
      _11_ = "command"
    elseif (case_10_ == "function") then
      _11_ = "callback"
    else
      _11_ = nil
    end
  end
  vim.api.nvim_create_autocmd(event, {pattern = pattern, group = _3fgroup, [_11_] = action})
  return _3fgroup
end
local function create_once(event, pattern, action, _3fgroup)
  if (nil == action) then
    _G.error("Missing argument action on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/autocmd.fnl:21", 2)
  else
  end
  if (nil == pattern) then
    _G.error("Missing argument pattern on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/autocmd.fnl:21", 2)
  else
  end
  if (nil == event) then
    _G.error("Missing argument event on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/lib/autocmd.fnl:21", 2)
  else
  end
  local _19_
  do
    local case_18_ = type(action)
    if (case_18_ == "string") then
      _19_ = "command"
    elseif (case_18_ == "function") then
      _19_ = "callback"
    else
      _19_ = nil
    end
  end
  vim.api.nvim_create_autocmd(event, {pattern = pattern, group = _3fgroup, once = true, [_19_] = action})
  return _3fgroup
end
return {group = group, create = create, ["create-once"] = create_once}
