-- [nfnl] fnl/core/lsp.fnl
local _local_1_ = require("lib.table")
local first = _local_1_["first"]
local servers = {clangd = {}, ts_ls = {}, fennel_ls = {}, julials = {}, lua_ls = {}, nixd = {}, ocamllsp = {}, pyright = {}}
servers.fennel_ls.settings = {["fennel-ls"] = {["extra-globals"] = "vim"}}
local function _2_(buf, callback)
  return callback(first(vim.fs.find({"fnl", "git"}, {upward = true, type = "directory", path = vim.fn.bufname(buf)})))
end
servers.fennel_ls.root_dir = _2_
local function setup(_)
  for server, config in pairs(servers) do
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
  end
  return nil
end
return {servers = servers, setup = setup}
