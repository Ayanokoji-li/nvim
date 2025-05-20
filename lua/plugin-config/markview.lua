require("markview").setup({
});
-- Enable wrapping for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap"
})

-- Enable linebreak for better wrapping at word boundaries
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal linebreak"
})

