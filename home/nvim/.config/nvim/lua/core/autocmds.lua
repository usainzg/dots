-- [nfnl] fnl/core/autocmds.fnl
local function make_startup_bindings()
  vim.keymap.set("n", "-", "<Cmd>Oil<CR>", {buffer = true, nowait = true, silent = true})
  vim.keymap.set("n", "<C-l>", "<Cmd>lua MiniStarter.eval_current_item()<CR>", {buffer = true, nowait = true, silent = true})
  vim.keymap.set("n", "<C-j>", "<Cmd>lua MiniStarter.update_current_item('next')<CR>", {buffer = true, nowait = true, silent = true})
  return vim.keymap.set("n", "<C-k>", "<Cmd>lua MiniStarter.update_current_item('prev')<CR>", {buffer = true, nowait = true, silent = true})
end
local function setup(_self)
  local autocmd = require("lib.autocmd")
  do
    local autocmd_6_auto = require("lib.autocmd")
    local group_7_auto = autocmd_6_auto.group("terminal", "clear")
    do local _ = {autocmd.create("TermOpen", "*", "setlocal nonumber", group_7_auto)} end
  end
  do
    local autocmd_6_auto = require("lib.autocmd")
    local group_7_auto = autocmd_6_auto.group("markdown", "clear")
    do local _ = {autocmd.create("FileType", "markdown", "setlocal linebreak", group_7_auto)} end
  end
  do
    local autocmd_6_auto = require("lib.autocmd")
    local group_7_auto = autocmd_6_auto.group("icalendar", "clear")
    do local _ = {autocmd.create({"BufRead", "BufNewFile"}, "*.ics", "set fileformat=dos", group_7_auto)} end
  end
  do
    local autocmd_6_auto = require("lib.autocmd")
    local group_7_auto = autocmd_6_auto.group("pollen", "clear")
    do local _ = {autocmd.create("FileType", "pollen", "setlocal linebreak", group_7_auto)} end
  end
  local autocmd_6_auto = require("lib.autocmd")
  local group_7_auto = autocmd_6_auto.group("startup-extras", "clear")
  return {autocmd["create-once"]("User", "MiniStarterOpened", "lua MiniStarter.refresh()", group_7_auto), autocmd.create("User", "MiniStarterOpened", make_startup_bindings, group_7_auto)}
end
return {setup = setup}
