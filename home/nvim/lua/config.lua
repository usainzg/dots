-- [nfnl] fnl/config.fnl
require("core.filetype"):setup()
require("core.lsp"):setup()
require("core.options"):setup()
require("core.autocmds"):setup()
require("core.keymaps"):setup()
require("core.journal"):setup()
require("core.neovide"):setup()
return require("core.compat"):setup()
