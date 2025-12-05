-- [nfnl] fnl/core/journal.fnl
local system = require("lib.system")
local time = require("lib.time")
local ext = ".md"
local function journal_dir_path()
  local _1_ = system["hostname-prefix"]()
  if (_1_ == "pilatus") then
    return "~/Documents/Journal"
  elseif (_1_ == "RIGI") then
    return "~/iCloudDrive/Documents/Journal"
  else
    local _ = _1_
    return nil
  end
end
local function todo_filename()
  return ("TODO" .. ext)
end
local function daily_entry_filename_on(_3_)
  local year = _3_["year"]
  local month = _3_["month"]
  local day = _3_["day"]
  _G.assert((nil ~= day), "Missing argument day on /home/usainzg/.config/nvim/fnl/core/journal.fnl:19")
  _G.assert((nil ~= month), "Missing argument month on /home/usainzg/.config/nvim/fnl/core/journal.fnl:19")
  _G.assert((nil ~= year), "Missing argument year on /home/usainzg/.config/nvim/fnl/core/journal.fnl:19")
  return (string.format("%04d", year) .. string.format("%02d", month) .. string.format("%02d", day) .. ext)
end
local function weekly_entry_filename_on(_4_)
  local year = _4_["year"]
  local date = _4_
  _G.assert((nil ~= date), "Missing argument date on /home/usainzg/.config/nvim/fnl/core/journal.fnl:24")
  _G.assert((nil ~= year), "Missing argument year on /home/usainzg/.config/nvim/fnl/core/journal.fnl:24")
  local week = time.week(date)
  return (string.format("%04d", year) .. "W" .. string.format("%02d", week) .. ext)
end
local function quarterly_entry_filename_on(_5_)
  local year = _5_["year"]
  local date = _5_
  _G.assert((nil ~= date), "Missing argument date on /home/usainzg/.config/nvim/fnl/core/journal.fnl:29")
  _G.assert((nil ~= year), "Missing argument year on /home/usainzg/.config/nvim/fnl/core/journal.fnl:29")
  local quarter = time.quarter(date)
  return (string.format("%04d", year) .. "Q" .. string.format("%01d", quarter) .. ext)
end
local function open_journal()
  return vim.cmd.edit(journal_dir_path())
end
local function edit_journal(filename)
  return vim.cmd.edit(vim.fs.joinpath(journal_dir_path(), filename))
end
local function edit_journal_todo()
  return edit_journal(todo_filename())
end
local function edit_journal_today_daily()
  return edit_journal(daily_entry_filename_on(time.now()))
end
local function edit_journal_today_weekly()
  return edit_journal(weekly_entry_filename_on(time.now()))
end
local function edit_journal_today_quarterly()
  return edit_journal(quarterly_entry_filename_on(time.now()))
end
local function setup(_self)
  local command
  local function _6_(_241, _242)
    return vim.api.nvim_create_user_command(_241, _242, {})
  end
  command = _6_
  command("JournalOpen", open_journal)
  command("JournalTodo", edit_journal_todo)
  command("JournalToday", edit_journal_today_daily)
  command("JournalDaily", edit_journal_today_daily)
  command("JournalWeekly", edit_journal_today_weekly)
  return command("JournalQuarterly", edit_journal_today_quarterly)
end
return {["journal-dir-path"] = journal_dir_path, ["todo-filename"] = todo_filename, ["daily-entry-filename-on"] = daily_entry_filename_on, ["weekly-entry-filename-on"] = weekly_entry_filename_on, ["quarterly-entry-filename-on"] = quarterly_entry_filename_on, ["open-journal"] = open_journal, ["edit-journal"] = edit_journal, ["edit-journal-today-daily"] = edit_journal_today_daily, ["edit-journal-today-weekly"] = edit_journal_today_weekly, ["edit-journal-today-quarterly"] = edit_journal_today_quarterly, setup = setup}
