local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    -- common.keyAttach(bufnr)
  end,
  cmd = { "clangd", "--query-driver=/usr/bin/gcc"},
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp", "inl" },
  root_dir = require'lspconfig'.util.root_pattern(".clangd", "compile_commands.json", "compile_flags.txt")
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
