local status, ident_blankline = pcall(require, "ibl")
if not status then
  vim.notify("没有找到 indent_blankline")
  return
end

ident_blankline.setup({
  exclude = {
    filetypes = {
      "checkhealth",
      "man",
      "gitcommit",
      "null-ls-info",
      "dashboard",
      "packer",
      "terminal",
      "help",
      "log",
      "markdown",
      "TelescopePrompt",
      "TelescopeResults",
      "lsp-installer",
      "lspinfo",
      "toggleterm",
      "''",
      "text",
    }
  },
  indent = {
    char = "",
    tab_char = "",
  },
  scope = {
    show_start = true,
    enabled = true,
    show_end = true,
    injected_languages = false,
    highlight = { "Function", "Label" },
    priority = 500,
  },
  -- main = "ibl",
})
