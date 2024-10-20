require("markview").setup({
  injections = {
    languages = {
      markdown = {
        --- This disables other
        --- injected queries!
        overwrite = true,
        query = [[
                    (section
                        (atx_headng) @injections.mkv.fold
                        (#set! @fold))
                ]]
      }
    }
  }
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

