
local function on_attach(client, bufnr)
  vim.api.nvim_command [[augroup Format]]
  vim.api.nvim_command [[autocmd! * <buffer>]]
  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  vim.api.nvim_command [[augroup END]]
end

return {
  on_setup = function(server)
    server.setup({
      cmd = {"/home/ayanokouji/go/bin/gopls"},
      on_attach = on_attach,
    })
  end,
}
