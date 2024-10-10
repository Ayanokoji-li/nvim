local common = require("lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  cmd = { "clangd", "--background-index", "--query-driver=/usr/bin/g++" },
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
