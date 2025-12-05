-- [nfnl] fnl/plugins/csvview.fnl
local opts
do
  local bind
  local function _1_(keys, mode)
    return {keys, mode = mode}
  end
  bind = _1_
  opts = {parser = {comments = {"#", "//"}}, view = {display_mode = "border"}, keymaps = {textobject_field_inner = bind("if", {"o", "x"}), textobject_field_outer = bind("af", {"o", "x"}), jump_next_field_end = bind("<Tab>", {"n", "v"}), jump_prev_field_end = bind("<S-Tab>", {"n", "v"}), jump_next_row = bind("<Enter>", {"n", "v"}), jump_prev_row = bind("<S-Enter>", {"n", "v"})}}
end
return {"hat0uma/csvview.nvim", cmd = {"CsvViewEnable", "CsvViewDisable", "CsvViewToggle"}, opts = opts}
