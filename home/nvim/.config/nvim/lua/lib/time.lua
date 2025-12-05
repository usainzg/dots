-- [nfnl] fnl/lib/time.fnl
local _local_1_ = require("lib.math")
local div = _local_1_["div"]
local function round_month_to_quarter(month)
  _G.assert((nil ~= month), "Missing argument month on /home/usainzg/.config/nvim/fnl/lib/time.fnl:5")
  return math.ceil((month / 3))
end
local function weeks_in_year(year)
  _G.assert((nil ~= year), "Missing argument year on /home/usainzg/.config/nvim/fnl/lib/time.fnl:9")
  local p
  local function _2_(y)
    return math.fmod((y + div(y, 4) + ( - div(y, 100)) + div(y, 400)), 7)
  end
  p = _2_
  if ((p(year) == 4) or (p((year - 1)) == 3)) then
    return 53
  else
    return 52
  end
end
local function quarter(date)
  _G.assert((nil ~= date), "Missing argument date on /home/usainzg/.config/nvim/fnl/lib/time.fnl:17")
  return round_month_to_quarter(date.month)
end
local function week(date)
  _G.assert((nil ~= date), "Missing argument date on /home/usainzg/.config/nvim/fnl/lib/time.fnl:21")
  local y = date.year
  local w = math.floor(((10 + date.yday + date.wday) / 7))
  if (w < 1) then
    return weeks_in_year((y - 1))
  elseif (w > weeks_in_year(y)) then
    return 1
  else
    return w
  end
end
local function now()
  return os.date("*t")
end
local function now_utc()
  return os.date("!*t")
end
return {["round-month-to-quarter"] = round_month_to_quarter, ["weeks-in-year"] = weeks_in_year, quarter = quarter, week = week, now = now, ["now-utc"] = now_utc}
