-- [nfnl] fnl/core/compat.fnl
local function disable_nvim_treesitter_git_downloads()
  local treesitter_install = require("nvim-treesitter.install")
  treesitter_install["prefer-git"] = false
  return nil
end
local function set_windows_treesitter_compilers(compilers)
  _G.assert((nil ~= compilers), "Missing argument compilers on /home/usainzg/.config/nvim/fnl/core/compat.fnl:11")
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
  _G.assert((nil ~= path), "Missing argument path on /home/usainzg/.config/nvim/fnl/core/compat.fnl:18")
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
local jabber_path = "~/projects/final-year-project/tree-sitter-jabber"
local jabber_config = {filetype = "jbr", install_info = {url = jabber_path, files = {"src/parser.c"}, branch = "main"}}
local function load_jabber_parser()
  if vim.uv.fs_stat(vim.fs.normalize(jabber_path)) then
    local parsers = require("nvim-treesitter.parsers"):get_parser_configs()
    vim.treesitter.language.register("jabber", "jbr")
    parsers.jabber = jabber_config
    return nil
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
      local function _5_(err, result, context, config)
        local _7_
        do
          local t_6_ = err
          if (nil ~= t_6_) then
            t_6_ = t_6_.code
          else
          end
          _7_ = t_6_
        end
        if (_7_ ~= -32802) then
          return default_diagnostic_handler(err, result, context, config)
        else
          return nil
        end
      end
      vim.lsp.handlers[method] = _5_
    end
    return nil
  else
    return nil
  end
end
local function load_colorscheme_by_term(default)
  _G.assert((nil ~= default), "Missing argument default on /home/usainzg/.config/nvim/fnl/core/compat.fnl:57")
  local term = require("lib.term")
  local function _12_()
    local _11_ = term.program()
    if (_11_ == term.TERM.WEZTERM) then
      return "catppuccin-macchiato"
    elseif (_11_ == term.TERM.GHOSTTY) then
      return "alabaster"
    elseif (_11_ == term.TERM.NEOVIDE) then
      return "everforest"
    elseif (_11_ == term.TERM.WINTERM) then
      return "everforest"
    else
      local _ = _11_
      return default
    end
  end
  return vim.cmd.colorscheme(_12_())
end
local function set_colorscheme_mode_by_term(default)
  _G.assert((nil ~= default), "Missing argument default on /home/usainzg/.config/nvim/fnl/core/compat.fnl:67")
  local term = require("lib.term")
  do
    local _14_ = term.program()
    if (_14_ == term.TERM.WEZTERM) then
      vim.opt.bg = "dark"
    elseif (_14_ == term.TERM.GHOSTTY) then
      vim.opt.bg = "light"
    elseif (_14_ == term.TERM.NEOVIDE) then
      vim.opt.bg = "light"
    elseif (_14_ == term.TERM.WINTERM) then
      vim.opt.bg = "dark"
    else
      local _ = _14_
      vim.opt.bg = default
    end
  end
  return nil
end
local function setup(_self)
  disable_nvim_treesitter_git_downloads()
  set_windows_treesitter_compilers({"zig"})
  set_default_neovide_path(vim.env.HOME)
  load_colorscheme_by_term("catppuccin-latte")
  set_colorscheme_mode_by_term("dark")
  return patch_neovim_30985()
end
return {["load-jabber-parser"] = load_jabber_parser, setup = setup}
