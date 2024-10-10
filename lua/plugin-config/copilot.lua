-- 禁用 Copilot 在 Copilot Chat 中的补全功能
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilotchat",
  callback = function()
    print("disabled")
    vim.b.copilot_enabled = false
  end,
})
