-- [nfnl] fnl/plugins/gitsigns.fnl
local signs = {add = {text = "\226\148\131"}, change = {text = "\226\148\131"}, delete = {text = "_"}, topdelete = {text = "\226\128\190"}, changedelete = {text = "\226\148\134"}}
return {"lewis6991/gitsigns.nvim", opts = {signs = signs}}
