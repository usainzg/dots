-- [nfnl] fnl/plugins/catpuccin.fnl
local integrations = {gitsigns = true, treesitter = true, ["nvim-ufo"] = true, octo = true, telescope = {enabled = true}, lsp_trouble = true}
return {"catppuccin/nvim", priority = 1000, name = "catpuccin", integrations = integrations}
