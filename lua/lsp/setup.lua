-- :h mason-default-settings
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
local status_mason_config, mason_config = pcall(require, "mason-config")
local status_lspconfig, lspconfig = pcall(require, "nvim-lspconfig")

if status_mason_config or status_lspconfig then
  vim.notify("lsp 插件未找到")
  return
end

mason_config.setup({
  ensure_installed = {
    "pyright",
    "rust_analyzer",
    "clangd",
    "cmake",
  },
})
local servers = {
  lua_ls = require("lsp.config.lua"),
}

for name, config in pairs(servers) do
  print("config", config)
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    print(lspconfig[name])
    lspconfig[name].setup({})
  end
end

require(lsp.ui)
