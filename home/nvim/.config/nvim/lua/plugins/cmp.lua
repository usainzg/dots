-- [nfnl] fnl/plugins/cmp.fnl
local version = "1.*"
local dependencies = {"rafamadriz/friendly-snippets", "kdheepak/cmp-latex-symbols", {"saghen/blink.compat", lazy = true, opts = {}, version = "*"}}
local function enabled()
  local _2_
  do
    local t_1_ = vim.g
    if (nil ~= t_1_) then
      t_1_ = t_1_["blink-cmp-enable"]
    else
    end
    _2_ = t_1_
  end
  return (_2_ or false)
end
local function init()
  vim.g["blink-cmp-enable"] = true
  return nil
end
local function expand(snippet)
  vim.snippet.expand(snippet)
  return vim.snippet.stop()
end
local keymap = {preset = "default", ["<Tab>"] = {"fallback"}, ["<S-Tab>"] = {"fallback"}}
local providers = {latex_symbols = {name = "latex_symbols", module = "blink.compat.source", opts = {strategy = 0}}}
local opts = {keymap = keymap, enabled = enabled, appearance = {nerd_font_variant = "mono"}, completion = {documentation = {auto_show = true}}, snippets = {expand = expand}, sources = {default = {"lsp", "path", "snippets", "buffer", "latex_symbols"}, providers = providers}}
local opts_extend = {"sources.default"}
return {"saghen/blink.cmp", version = version, dependencies = dependencies, init = init, opts = opts, opts_extend = opts_extend}
