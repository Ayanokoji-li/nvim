local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {


    'wbthomason/packer.nvim',
  
    'folke/tokyonight.nvim',

    'navarasu/onedark.nvim',

    { "kyazdani42/nvim-tree.lua", dependences = "kyazdani42/nvim-web-devicons" },

    -- bufferline
    { "akinsho/bufferline.nvim", dependences = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }},

    -- lualine
    { "nvim-lualine/lualine.nvim", dependences = { "kyazdani42/nvim-web-devicons" } },
    "arkav/lualine-lsp-progress",

    -- telescope
    { 'nvim-telescope/telescope.nvim', dependence = { "nvim-lua/plenary.nvim" } },

    -- telescope extensions
    "LinArcX/telescope-env.nvim",

    -- dashboard-nvim
    {'glepnir/dashboard-nvim', dependence = {'nvim-tree/nvim-web-devicons'}},

    -- project
    "ahmedkhalf/project.nvim",

    -- nvim-treesitter
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    { "neovim/nvim-lspconfig"},

}


local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
