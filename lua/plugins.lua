local packer = require("packer")

packer.startup({
  function(use)
  
    use 'wbthomason/packer.nvim'
  
    use 'folke/tokyonight.nvim'

    use  'navarasu/onedark.nvim'

    use ({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")

    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } } 

    -- telescope extensions
    use "LinArcX/telescope-env.nvim"

    -- dashboard-nvim
    use {'glepnir/dashboard-nvim',requires = {'nvim-tree/nvim-web-devicons'}}

    -- project
    use("ahmedkhalf/project.nvim")

    -- nvim-treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    --------------------- LSP --------------------
    use("williamboman/nvim-lsp-installer")
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })

  end,

  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    }
  }
})

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    autogroup end
  ]]
)
