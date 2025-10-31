local util = require("lspconfig.util")

local function get_command()
  local cmd = {
    "/Users/jjasmine/Developer/igalia/llvm-project/build/bin/tblgen-lsp-server",
  }
  local files = vim.fs.find("tablegen_compile_commands.yml", { path = vim.fn.expand("%:p:h"), upward = true })
  if #files > 0 then
    local file = files[1]
    table.insert(cmd, "--tablegen-compilation-database=" .. vim.fs.dirname(file) .. "/tablegen_compile_commands.yml")
  end

  return cmd
end

return {
  cmd = get_command(),
  filetypes = { "tablegen" },
  root_dir = function(fname)
    return util.root_pattern("tablegen_compile_commands.yml")(fname)
      or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
  end,
}
