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

  { "kyazdani42/nvim-tree.lua", dependencies = "kyazdani42/nvim-web-devicons" },

  -- bufferline
  { "akinsho/bufferline.nvim",  dependencies= { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }},

  -- lualine
  { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
  "arkav/lualine-lsp-progress",

  -- telescope
  { 'nvim-telescope/telescope.nvim', dependencies = { "nvim-lua/plenary.nvim" } },

  -- telescope extensions
  "LinArcX/telescope-env.nvim",

  -- dashboard-nvim
  {'glepnir/dashboard-nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},

  -- project
  "ahmedkhalf/project.nvim",

  -- nvim-treesitter
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig"},

  "hrsh7th/nvim-cmp",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "rafamadriz/friendly-snippets",

  "onsails/lspkind-nvim",
  {"lukas-reineke/indent-blankline.nvim", main = "ibl", opt = {} },
  {'nvimdev/lspsaga.nvim',dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }},


}


local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
