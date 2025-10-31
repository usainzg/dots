return {
  "badumbatish/brt.nvim",
  -- -- Uncomment these two lines to contribute and develop
  -- dir = "~/Developer/nvim_proj/brt.nvim",
  -- dev = { true },
  -- @t
  config = function()
    local brt = require("brt")
    brt.setup()
  end,
}
