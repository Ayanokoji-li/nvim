local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

local status, keybindings = pcall(require, "keybindings")

if not status then
  print("not include keybindings")
  return
end

local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
  print("not include nvim-tree")
  return
end
-- 获取 nvim-tree 的当前工作目录
local function get_nvim_tree_cwd()
  return nvim_tree.get_node_at_cursor().absolute_path
end
-- print(keybindings.telescopeList)

if type(keybindings.telescopeList) ~= 'table' then
  print('Error: keybindings is not a table', os.date("%Y-%m-%d %H:%M:%S"))
  return
end

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      theme = "dropdown", 
    }
  },
  extensions = {
     -- 扩展插件配置
  },
})

-- telescope extensions
pcall(telescope.load_extension, "env")
