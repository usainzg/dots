-- [nfnl] fnl/core/journal.fnl
local system = require("lib.system")
local time = require("lib.time")
local ext = ".md"
local function journal_dir_path()
  local case_1_ = system["hostname-prefix"]()
  if (case_1_ == "GALACTUS") then
    return "~/Projects/null-pointers/10-19 PhD/12 Log/12.00 Journal"
  elseif (case_1_ == "PRIMUS") then
    return "~/Documents/Journal"
  else
    local _ = case_1_
    return nil
  end
end
local function todo_filename()
  return ("TODO" .. ext)
end
local function daily_entry_filename_on(_3_)
  local year = _3_.year
  local month = _3_.month
  local day = _3_.day
  if (nil == day) then
    _G.error("Missing argument day on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/journal.fnl:20", 2)
  else
  end
  if (nil == month) then
    _G.error("Missing argument month on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/journal.fnl:20", 2)
  else
  end
  if (nil == year) then
    _G.error("Missing argument year on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/journal.fnl:20", 2)
  else
  end
  return (string.format("%04d", year) .. "-" .. string.format("%02d", month) .. "-" .. string.format("%02d", day) .. ext)
end
local function weekly_entry_filename_on(_7_)
  local year = _7_.year
  local date = _7_
  if (nil == date) then
    _G.error("Missing argument date on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/journal.fnl:25", 2)
  else
  end
  if (nil == year) then
    _G.error("Missing argument year on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/journal.fnl:25", 2)
  else
  end
  local week = time.week(date)
  return (string.format("%04d", year) .. "W" .. string.format("%02d", week) .. ext)
end
local function quarterly_entry_filename_on(_10_)
  local year = _10_.year
  local date = _10_
  if (nil == date) then
    _G.error("Missing argument date on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/journal.fnl:30", 2)
  else
  end
  if (nil == year) then
    _G.error("Missing argument year on /home/usainzg/Projects/dots/home/nvim/.config/nvim/fnl/core/journal.fnl:30", 2)
  else
  end
  local quarter = time.quarter(date)
  return (string.format("%04d", year) .. "Q" .. string.format("%01d", quarter) .. ext)
end
local function open_journal()
  return vim.cmd.edit(journal_dir_path())
end
local function edit_journal(entry_type, filename)
  return vim.cmd.edit(vim.fs.joinpath(vim.fs.joinpath(journal_dir_path(), entry_type), filename))
end
local function daily_entry_type()
  return "12.01 Daily"
end
local function edit_journal_todo()
  return edit_journal(todo_filename())
end
local function edit_journal_today_daily()
  return edit_journal(daily_entry_type(daily_entry_filename_on, time.now()))
end
local function edit_journal_today_weekly()
  return edit_journal(__fnl_global__weekly_2dentry_2dtype(weekly_entry_filename_on, time.now()))
end
local function edit_journal_today_quarterly()
  return edit_journal(__fnl_global__quarterly_2dentry_2dtype(quarterly_entry_filename_on, time.now()))
end
local function setup(_self)
  local command
  local function _13_(_241, _242)
    return vim.api.nvim_create_user_command(_241, _242, {})
  end
  command = _13_
  command("JournalOpen", open_journal)
  command("JournalTodo", edit_journal_todo)
  command("JournalToday", edit_journal_today_daily)
  command("JournalDaily", edit_journal_today_daily)
  command("JournalWeekly", edit_journal_today_weekly)
  return command("JournalQuarterly", edit_journal_today_quarterly)
end
return {["journal-dir-path"] = journal_dir_path, ["todo-filename"] = todo_filename, ["daily-entry-filename-on"] = daily_entry_filename_on, ["weekly-entry-filename-on"] = weekly_entry_filename_on, ["quarterly-entry-filename-on"] = quarterly_entry_filename_on, ["open-journal"] = open_journal, ["edit-journal"] = edit_journal, ["edit-journal-today-daily"] = edit_journal_today_daily, ["edit-journal-today-weekly"] = edit_journal_today_weekly, ["edit-journal-today-quarterly"] = edit_journal_today_quarterly, setup = setup}
