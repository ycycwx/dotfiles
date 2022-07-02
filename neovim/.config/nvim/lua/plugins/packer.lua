-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

local cmd = vim.cmd
cmd([[packadd packer.nvim]])

local packer = require('packer')

-- Add packages
return packer.startup(function()
  use('wbthomason/packer.nvim') -- packer can manage itself

  -- file explorer
  use('kyazdani42/nvim-tree.lua')

  -- indent line
  use('lukas-reineke/indent-blankline.nvim')

  -- autopair
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  })

  -- icons
  use('kyazdani42/nvim-web-devicons')

  -- treesitter interface
  use('nvim-treesitter/nvim-treesitter')

  -- colorschemes
  use('tanvirtin/monokai.nvim')

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- LSP
  use('neovim/nvim-lspconfig')

  -- null-ls
  use('jose-elias-alvarez/null-ls.nvim')

  -- autocomplete
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  })

  -- statusline
  use({
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  })

  -- git labels
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  })

  -- dashboard
  use({
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
    end,
  })

  -- copilot
  -- use('github/copilot.vim')

  -- telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  -- surround
  use('tpope/vim-surround')

  -- trouble
  use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  -- wakatime
  use('wakatime/vim-wakatime')
end)
