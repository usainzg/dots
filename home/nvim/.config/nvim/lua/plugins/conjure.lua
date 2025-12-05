-- [nfnl] fnl/plugins/conjure.fnl
local function eval_fennel_in_cmd(tbl)
  local eval = require("conjure.eval")
  local client = require("conjure.client")
  return client["with-filetype"]("fennel", eval["eval-str"], {origin = tbl.name, ["passive?"] = true, code = tbl.args, ["on-result"] = require("nfnl.notify").info})
end
vim.api.nvim_create_user_command("Fnl", eval_fennel_in_cmd, {nargs = "?"})
local function _1_()
  local main = require("conjure.main")
  local mapping = require("conjure.mapping")
  main.main()
  return mapping["on-filetype"](mapping)
end
local function _2_()
  vim.g["conjure#debug"] = true
  vim.g["conjure#mapping#doc_word"] = false
  vim.g["conjure#log#hud#enabled"] = false
  vim.g["conjure#client#scheme#stdio#command"] = "scheme"
  vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
  vim.g["conjure#client#scheme#stdio#value_prefix_pattern"] = false
  vim.g["conjure#filetype#janet"] = "conjure.client.janet.stdio"
  return nil
end
return {"Olical/conjure", ft = {"clojure", "fennel", "racket", "scheme", "janet"}, config = _1_, init = _2_}
