-- [nfnl] fnl/plugins/start-up.fnl
local function lazy_stats()
  local _let_1_ = require("lazy")
  local stats = _let_1_["stats"]
  return stats()
end
local function header()
  local _let_2_ = lazy_stats()
  local count = _let_2_["count"]
  local loaded = _let_2_["loaded"]
  local startuptime = _let_2_["startuptime"]
  return string.format("loaded %d/%d plugins in %.3fms", loaded, count, startuptime)
end
local function footer()
  return ""
end
local function open_items()
  local _let_3_ = require("core.keymaps")
  local goto_dir_and_edit = _let_3_["goto-dir-and-edit"]
  local open_scratch_buffer = _let_3_["open-scratch-buffer"]
  local open_short_term = _let_3_["open-short-term"]
  local item
  local function _4_(name, action)
    return {name = name, action = action, section = "open"}
  end
  item = _4_
  local function _5_()
    return goto_dir_and_edit("~/projects")
  end
  local function _6_()
    return goto_dir_and_edit(vim.fn.stdpath("config"))
  end
  return {item("projects", _5_), item("journal", "JournalOpen"), item("config", _6_), item("lazy", "Lazy"), item("terminal", open_short_term), item("scratch buffer", open_scratch_buffer)}
end
local function journal_items()
  local item
  local function _7_(name, action)
    return {name = name, action = action, section = "journal"}
  end
  item = _7_
  return {item("todo", "JournalTodo"), item("daily", "JournalDaily"), item("weekly", "JournalWeekly"), item("quarterly", "JournalQuarterly")}
end
local function recent_files()
  local starter = require("mini.starter")
  local items = starter.sections.recent_files(15)()
  local tbl_21_ = {}
  local i_22_ = 0
  for _, _8_ in ipairs(items) do
    local name = _8_["name"]
    local action = _8_["action"]
    local val_23_ = {name = name, action = action, section = "recent files"}
    if (nil ~= val_23_) then
      i_22_ = (i_22_ + 1)
      tbl_21_[i_22_] = val_23_
    else
    end
  end
  return tbl_21_
end
local function actions()
  local item
  local function _10_(name, action)
    return {name = name, action = action, section = "actions"}
  end
  item = _10_
  return {item("quit", "q")}
end
local function items()
  return {open_items, journal_items, recent_files, actions}
end
local function opts(_plugin, _opts)
  local items0 = items()
  local footer0 = footer()
  return {header = header, items = items0, footer = footer0, silent = true}
end
return {"nvim-mini/mini.starter", version = "*", opts = opts, enabled = false}
