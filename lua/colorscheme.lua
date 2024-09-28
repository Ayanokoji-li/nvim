vim.opt.termguicolors = true

-- vim.cmd([[
--   augroup MyColors
--     autocmd!
--     autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
--   augroup END
-- ]])

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

