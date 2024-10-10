local map = vim.api.nvim_set_keymap

-- 复用 opt 参数
local opt = {noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- jj进入normal
map("i", "jj", "<Esc>", opt)
-- map("v", "jj", "<Esc>", opt)

-- 系统剪切板
map("v", "<leader>y", "\"+y", opt)
map("n", "<leader>yy", "\"+yy", opt)
map("n", "<leader>p", "\"+p", opt)

-- 处理ctrl-v
map('n', "<leader>v", "<C-v>", opt)

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- Leader + hjkl  窗口交换位置
map("n", "<leader>h", "<C-w>H", opt)
map("n", "<leader>j", "<C-w>J", opt)
map("n", "<leader>k", "<C-w>K", opt)
map("n", "<leader>l", "<C-w>L", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize -2<CR>", opt)
map("n", "<C-Up>", ":resize +2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)


-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "jj", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)


-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- insert 模式下，跳到下一个单词
map("i", "<C-h>", "<C-Left>", opt)
map("i", "<C-l>", "<C-Right>", opt)

-- alt + 方向键，光标移动
map('n', "<A-left>", "<C-o>", opt)
map('i', "<A-left>", "<C-o>", opt)
map('n', "<A-right>", "<C-i>", opt)
map('i', "<A-right>", "<C-i>", opt)

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
-- mapferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>bc", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bw", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- 最近文件
map("n", "<leader>f", ":Telescope oldfiles<CR>", opt)


-- copilot chat
map("n", "<leader>cc", ":CopilotChat<CR>", opt)
map("n", "<leader>cp", ":CopilotChatPost<CR>", opt)
map("n", "<leader>cl", ":CopilotChatList<CR>", opt)
map("n", "<leader>cd", ":CopilotChatDelete<CR>", opt)
map("i", "<C-J>", 'copilot#Accept("<CR>")', opt)

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

-- Treesitting
-- 缩进格式化
map("n", "<leader>=", "gg=G", opt)

-- keybindings.lua
local pluginKeys = {

  -- Telescope 列表中 插入模式快捷键
  telescopeList = {
    i = {
      -- 上下移动
      ["<C-j>"] = "move_selection_next",
      ["<C-k>"] = "move_selection_previous",
      ["<Down>"] = "move_selection_next",
      ["<Up>"] = "move_selection_previous",
      -- 历史记录
      ["<C-n>"] = "cycle_history_next",
      ["<C-p>"] = "cycle_history_prev",
      -- 关闭窗口
      ["<C-c>"] = "close",
      -- 预览窗口上下滚动
      ["<C-u>"] = "preview_scrolling_up",
      ["<C-d>"] = "preview_scrolling_down",
    },
  },
}

pluginKeys.mapLSP = function(bufmap)
  print("start set lsp map")
  -- rename
  --[[
  Lspsaga 替换 rn
  map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  --]]
  bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  --[[
  Lspsaga 替换 ca
  map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  --]]
  bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  --[[
    map('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]
  bufmap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
  --[[
  map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga 替换 gh
  --]]
  bufmap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  -- Lspsaga 替换 gr
  bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
  --map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  --Lspsaga 替换 gp, gj, gk
  bufmap("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  bufmap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  bufmap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
end

-- rename
-- Lspsaga 替换 rn
  map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
--map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
-- code action
--[[
  Lspsaga 替换 ca
  --]]
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
-- map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
-- go xx
--[[
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  --]]
map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opt)
map('n', 'gtd', '<cmd>Lspsaga goto_type_definition<CR>', opt)
map('n', 'gD',  '<cmd>Lspsaga peek_definition<CR>', opt)
-- map("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
--[[
  Lspsaga 替换 gh
  --]]
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
-- map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
-- Lspsaga 替换 gr
-- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
--]]
map("n", "gr", "<cmd>Lspsaga finder<CR>", opt)
--Lspsaga 替换 gp, gj, gk
-- map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
-- map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
-- map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
-- diagnostic
map("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
map("n", "go", "<cmd>Lspsaga outline<CR>", opt)
-- 未用
-- map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
-- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
-- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
-- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
-- map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
-- map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
-- map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
-- map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)


-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
  return {
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }
end

return pluginKeys
