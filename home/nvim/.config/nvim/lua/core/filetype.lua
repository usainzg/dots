-- [nfnl] fnl/core/filetype.fnl
local function setup(_self)
  vim.filetype.add({extension = {ebnf = "ebnf"}})
  vim.filetype.add({extension = {lalrpop = "lalrpop"}})
  vim.filetype.add({extension = {tokeignore = "gitignore"}})
  vim.filetype.add({extension = {pm = "pollen"}})
  vim.filetype.add({extension = {pp = "pollen"}})
  return vim.filetype.add({extension = {ptree = "pollen"}})
end
return {setup = setup}
