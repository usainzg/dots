-- [nfnl] fnl/core/keymaps.fnl
local _local_1_ = require("lib.keymap")
local group = _local_1_.group
local map = _local_1_.map
local slot = _local_1_.slot
local buffer = require("lib.buffer")
local md = require("lib.markdown")
local function format_buffer()
  local conform = require("conform")
  return conform.format({async = true, lsp_fallback = true})
end
local function open_short_term()
  vim.cmd("ToggleTerm")
  vim.keymap.set("t", "<Esc>", "<cmd>q<cr>", {buffer = true})
  return vim.cmd("startinsert")
end
local function open_full_term()
  vim.cmd("terminal")
  return vim.cmd("startinsert")
end
local function goto_dir_and_edit(dir)
  if (nil == dir) then
    _G.error("Missing argument dir on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/keymaps.fnl:23", 2)
  else
  end
  vim.cmd.cd(dir)
  vim.cmd.edit(".")
  return vim.notify(("set cwd to " .. vim.fn.expand(dir)), vim.log.levels.INFO)
end
local function toggle_neotest_summary()
  local nt = require("neotest")
  return nt.summary.toggle()
end
local function toggle_colorscheme_mode()
  do
    local case_3_ = vim.opt.bg._value
    if (case_3_ == "light") then
      vim.opt.bg = "dark"
    elseif (case_3_ == "dark") then
      vim.opt.bg = "light"
    else
      vim.opt.bg = nil
    end
  end
  return nil
end
local function toggle_typst_preview_follow_cursor()
  local typst = require("typst-preview")
  return typst.set_follow_cursor(not typst.get_follow_cursor())
end
local function toggle_completion()
  local state = vim.g["blink-cmp-enable"]
  vim.g["blink-cmp-enable"] = not state
  return nil
end
local function prompt_fennel_eval()
  return vim.cmd.Fnl(vim.fn.input({prompt = "eval: ", cancelreturn = "nil"}))
end
local function grapple_next_tag()
  local grapple = require("grapple")
  return grapple.cycle_tags("next")
end
local function grapple_prev_tag()
  local grapple = require("grapple")
  return grapple.cycle_tags("prev")
end
local scratch_lines = {";; scratch fennel buffer", ";; - see :help conjure-mappings for evaluation details", ";; - run :write <filename> to save the contents of this buffer", "", ""}
local function open_scratch_buffer()
  local tmp_9_ = buffer.create({listed = true, scratch = true})
  buffer["rename!"](tmp_9_, "*scratch*")
  buffer["set!"](tmp_9_, "filetype", "fennel")
  buffer["set!"](tmp_9_, "buftype", "nofile")
  buffer["set-lines!"](tmp_9_, 0, -1, scratch_lines)
  local function _5_()
    return vim.api.nvim_win_set_cursor(0, {5, 0})
  end
  buffer.open(tmp_9_, _5_)
  return tmp_9_
end
local function setup(_self)
  map("<leader>;", prompt_fennel_eval, "Evaluate Fennel expression")
  map("<Esc>", "<C-\\><C-n>", "Exit terminal mode", "t")
  map("J", ":m '>+1<CR>gv=gv", "Move selection down", "v")
  map("K", ":m '<-2<CR>gv=gv", "Move selection up", "v")
  group("<leader>c", "code")
  local function _6_()
    return vim.cmd.Trouble("diagnostics")
  end
  map("<leader>cd", _6_, "Show local diagnostics")
  map("<leader>cf", format_buffer, "Format buffer")
  map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
  local function _7_()
    return vim.cmd.Trouble("lsp_references")
  end
  map("<leader>cR", _7_, "Show references")
  map("<leader>ca", vim.lsp.buf.code_action, "Code actions")
  slot("<leader>ct", "Run tests")
  slot("<leader>cx", "Execute")
  group("<leader>f", "fix")
  local function _8_()
    return vim.cmd.TodoTrouble("keywords=HACK")
  end
  map("<leader>fh", _8_, "Fix HACKs")
  local function _9_()
    return vim.cmd.TodoTrouble("keywords=TODO")
  end
  map("<leader>ft", _9_, "Fix TODOs")
  local function _10_()
    return vim.cmd.Trouble("quickfix")
  end
  map("<leader>fq", _10_, "Quickfix")
  group("<leader>g", "git")
  local function _11_()
    return vim.cmd.Git("add -A")
  end
  map("<leader>gA", _11_, "Stage all")
  local function _12_()
    return vim.cmd.Git("commit")
  end
  map("<leader>gc", _12_, "Commit")
  local function _13_()
    return vim.cmd.Git("diff")
  end
  map("<leader>gd", _13_, "Diff")
  map("<leader>gg", vim.cmd.Git, "Status")
  local function _14_()
    return vim.cmd.Git("push")
  end
  map("<leader>gp", _14_, "Push")
  local function _15_()
    return vim.cmd.Telescope("git_branches")
  end
  map("<leader>gs", _15_, "Switch branch")
  local function _16_()
    return vim.cmd.Git("reset")
  end
  map("<leader>gu", _16_, "Unstage all")
  group("<leader>j", "journal")
  map("<leader>jd", vim.cmd.JournalToday, "Open daily journal entry")
  map("<leader>jo", vim.cmd.JournalOpen, "Open journal directory")
  map("<leader>jq", vim.cmd.JournalQuarterly, "Open quarterly journal entry")
  map("<leader>jt", vim.cmd.JournalTodo, "Open journal TODO file")
  map("<leader>jw", vim.cmd.JournalWeekly, "Open weekly journal entry")
  group("<leader>l", "lsp")
  map("<leader>lr", vim.cmd.LspRestart, "Restart server")
  map("<leader>ll", vim.cmd.LspLog, "Show server logs")
  map("<leader>li", vim.cmd.LspInfo, "Show LSP info")
  group("<leader>m", "mark")
  map("<leader>mn", grapple_next_tag, "Next mark")
  local function _17_()
    return vim.cmd.Grapple("toggle_tags")
  end
  map("<leader>mo", _17_, "Show marks in scope")
  map("<leader>mp", grapple_prev_tag, "Previous mark")
  local function _18_()
    return vim.cmd.Grapple("toggle")
  end
  map("<leader>mt", _18_, "Toggle mark")
  group("<leader>o", "open")
  local function _19_()
    return goto_dir_and_edit(vim.fn.stdpath("config"))
  end
  map("<leader>oc", _19_, "Open config")
  local function _20_()
    return vim.cmd("JournalOpen")
  end
  map("<leader>oj", _20_, "Open journal")
  local function _21_()
    return vim.cmd("Lazy")
  end
  map("<leader>ol", _21_, "Open lazy")
  local function _22_()
    return vim.cmd.Grapple("toggle_tags")
  end
  map("<leader>om", _22_, "Open marks in scope")
  local function _23_()
    return goto_dir_and_edit("~/Projects")
  end
  map("<leader>op", _23_, "Open projects")
  local function _24_()
    return vim.cmd.Lazy("profile")
  end
  map("<leader>oP", _24_, "Open lazy profiler")
  map("<leader>os", open_scratch_buffer, "Open new scratch buffer")
  local function _25_()
    return open_short_term()
  end
  map("<leader>ot", _25_, "Open terminal split")
  local function _26_()
    return open_full_term()
  end
  map("<leader>oT", _26_, "Open terminal here")
  group("<leader>p", "proof")
  group("<leader>s", "search")
  local function _27_()
    return vim.cmd.TodoTelescope("keywords=TODO")
  end
  map("<leader>st", _27_, "Search TODOs")
  local function _28_()
    return vim.cmd.TodoTelescope()
  end
  map("<leader>sc", _28_, "Search comment labels")
  local function _29_()
    return vim.cmd.Telescope("find_files")
  end
  map("<leader>sf", _29_, "Search files")
  local function _30_()
    return vim.cmd.Telescope("live_grep")
  end
  map("<leader>sg", _30_, "Grep files")
  local function _31_()
    return vim.cmd.Telescope("buffers")
  end
  map("<leader>sb", _31_, "Search buffers")
  group("<leader>t", "toggle")
  map("<leader>tc", toggle_completion, "Toggle completions")
  local function _32_()
    return vim.cmd.set("number!")
  end
  map("<leader>tl", _32_, "Toggle line numbers")
  map("<leader>tm", toggle_colorscheme_mode, "Toggle colorscheme mode")
  map("<leader>tt", toggle_neotest_summary, "Toggle test summary")
  map("<leader>tp", vim.cmd.ParinferToggle, "Toggle parinfer")
  map("<leader>tP", vim.cmd["ParinferToggle!"], "Toggle parinfer globally")
  local function _33_()
    return vim.cmd.set("relativenumber!")
  end
  map("<leader>tr", _33_, "Toggle relative line numbers")
  group("<leader>T", "typst")
  map("<leader>Tc", toggle_typst_preview_follow_cursor, "Toggle cursor following")
  map("<leader>Tp", vim.cmd.TypstPreviewToggle, "Toggle document preview")
  map("<leader>Ts", vim.cmd.TypstPreviewSyncCursor, "Sync preview with cursor position")
  group("<leader>w", "window")
  local function _34_()
    return vim.cmd.wincmd("h")
  end
  map("<leader>wh", _34_, "Go left")
  local function _35_()
    return vim.cmd.wincmd("j")
  end
  map("<leader>wj", _35_, "Go down")
  local function _36_()
    return vim.cmd.wincmd("k")
  end
  map("<leader>wk", _36_, "Go up")
  local function _37_()
    return vim.cmd.wincmd("l")
  end
  map("<leader>wl", _37_, "Go right")
  map("<leader>wo", vim.cmd.only, "Close other windows")
  map("<leader>wq", vim.cmd.q, "Close window")
  map("<leader>ws", vim.cmd.split, "Horizontal split")
  map("<leader>wv", vim.cmd.vsplit, "Vertical split")
  map("<localleader>t", md["toggle-check-on-cursor-line"], "Toggle Markdown checkbox")
  local function _38_()
    return vim.cmd("Oil")
  end
  map("-", _38_, "Open enclosing directory")
  local function _39_()
    return vim.lsp.buf.definition()
  end
  map("gd", _39_, "Goto definition")
  local function _40_()
    return vim.lsp.buf.hover()
  end
  return map("K", _40_, "LSP hover")
end
return {["format-buffer"] = format_buffer, ["goto-dir-and-edit"] = goto_dir_and_edit, ["open-full-term"] = open_full_term, ["open-short-term"] = open_short_term, ["open-scratch-buffer"] = open_scratch_buffer, ["prompt-fennel-eval"] = prompt_fennel_eval, ["scratch-lines"] = scratch_lines, setup = setup, ["toggle-colorscheme-mode"] = toggle_colorscheme_mode, ["toggle-neotest-summary"] = toggle_neotest_summary}
