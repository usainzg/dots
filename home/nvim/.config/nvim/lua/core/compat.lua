-- [nfnl] fnl/core/compat.fnl
local function disable_nvim_treesitter_git_downloads()
  local treesitter_install = require("nvim-treesitter.install")
  treesitter_install["prefer-git"] = false
  return nil
end
local function set_windows_treesitter_compilers(compilers)
  if (nil == compilers) then
    _G.error("Missing argument compilers on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/compat.fnl:11", 2)
  else
  end
  local system = require("lib.system")
  if system["windows?"]() then
    local ts_install = require("nvim-treesitter.install")
    ts_install["compilers"] = compilers
    return nil
  else
    return nil
  end
end
local function set_default_neovide_path(path)
  if (nil == path) then
    _G.error("Missing argument path on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/compat.fnl:18", 2)
  else
  end
  local term = require("lib.term")
  local table = require("lib.table")
  if term["neovide?"]() then
    if (vim.fn.getcwd() ~= table.last(vim.v.argv)) then
      return vim.cmd.cd(path)
    else
      return nil
    end
  else
    return nil
  end
end
local function patch_neovim_30985()
  local version = require("lib.version")
  local current_version = version.nvim()
  local v0_11_0 = version.parse("0.11.0")
  if current_version:lt(v0_11_0) then
    for _, method in ipairs({"textDocument/diagnostic", "workspace/diagnostic"}) do
      local default_diagnostic_handler = vim.lsp.handlers[method]
      local function _6_(err, result, context, config)
        local _8_
        do
          local t_7_ = err
          if (nil ~= t_7_) then
            t_7_ = t_7_.code
          else
          end
          _8_ = t_7_
        end
        if (_8_ ~= -32802) then
          return default_diagnostic_handler(err, result, context, config)
        else
          return nil
        end
      end
      vim.lsp.handlers[method] = _6_
    end
    return nil
  else
    return nil
  end
end
local function load_colorscheme_by_term(default)
  if (nil == default) then
    _G.error("Missing argument default on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/compat.fnl:57", 2)
  else
  end
  local term = require("lib.term")
  local function _14_()
    local case_13_ = term.program()
    if (case_13_ == term.TERM.WEZTERM) then
      return "catppuccin-macchiato"
    elseif (case_13_ == term.TERM.GHOSTTY) then
      return "alabaster"
    elseif (case_13_ == term.TERM.KITTY) then
      return "alabaster"
    elseif (case_13_ == term.TERM.NEOVIDE) then
      return "everforest"
    elseif (case_13_ == term.TERM.WINTERM) then
      return "everforest"
    else
      local _ = case_13_
      return default
    end
  end
  return vim.cmd.colorscheme(_14_())
end
local function set_colorscheme_mode_by_term(default)
  if (nil == default) then
    _G.error("Missing argument default on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/compat.fnl:68", 2)
  else
  end
  local term = require("lib.term")
  do
    local case_17_ = term.program()
    if (case_17_ == term.TERM.WEZTERM) then
      vim.opt.bg = "dark"
    elseif (case_17_ == term.TERM.GHOSTTY) then
      vim.opt.bg = "light"
    elseif (case_17_ == term.TERM.KITTY) then
      vim.opt.bg = "light"
    elseif (case_17_ == term.TERM.NEOVIDE) then
      vim.opt.bg = "light"
    elseif (case_17_ == term.TERM.WINTERM) then
      vim.opt.bg = "dark"
    else
      local _ = case_17_
      vim.opt.bg = default
    end
  end
  return nil
end
local function setup(_self)
  disable_nvim_treesitter_git_downloads()
  set_windows_treesitter_compilers({"zig"})
  set_default_neovide_path(vim.env.HOME)
  load_colorscheme_by_term("alabaster")
  set_colorscheme_mode_by_term("dark")
  return patch_neovim_30985()
end
return {setup = setup}
