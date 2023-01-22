-- Automatically download lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

local lazy = require('lazy')

lazy.setup({
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('core.lspconfig')
    end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
    },
  },

  {
    'williamboman/mason.nvim',
    config = function()
      require('core.mason')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('tool.tree')
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('interface.indent-blankline')
    end,
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('edit.autopairs')
    end,
    event = 'VeryLazy',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('core.treesitter')
    end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'nvim-treesitter/nvim-treesitter-refactor' },
      { 'windwp/nvim-ts-autotag' },
      { 'mrjones2014/nvim-ts-rainbow' },
      { 'RRethy/nvim-treesitter-endwise' },
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
    },
  },

  { 'tanvirtin/monokai.nvim' },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('colorscheme.rose-pine')
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('core.null-ls')
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
  },

  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('edit.cmp')
    end,
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-calc' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'kristijanhusak/vim-dadbod-completion' },
      { 'lukas-reineke/cmp-under-comparator' },
    },
    event = 'VeryLazy',
  },

  {
    'onsails/lspkind-nvim',
    config = function()
      require('interface.lspkind')
    end,
  },

  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
    config = function()
      require('edit.tabnine')
    end,
    dependencies = { 'hrsh7th/nvim-cmp' },
  },

  {
    'feline-nvim/feline.nvim',
    condig = function()
      require('interface.feline')
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('tool.gitsigns')
    end,
    dependencies = 'nvim-lua/plenary.nvim',
  },

  {
    'goolord/alpha-nvim',
    config = function()
      require('interface.alpha')
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('efficiency.telescope')
    end,
    dependencies = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      { 'nvim-telescope/telescope-hop.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-telescope/telescope-media-files.nvim' },
      { 'benfowler/telescope-luasnip.nvim' },
    },
    branch = '0.1.x',
    event = 'VeryLazy',
  },

  {
    'kylechui/nvim-surround',
    config = function()
      require('edit.surround')
    end,
    event = 'VeryLazy',
  },

  {
    'folke/trouble.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('tool.trouble')
    end,
    event = 'VeryLazy',
  },

  { 'wakatime/vim-wakatime' },

  { 'numToStr/Comment.nvim' },

  { 'gpanders/editorconfig.nvim' },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('interface.notify')
    end,
  },

  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('edit.snip')
    end,
    event = 'VeryLazy',
  },

  {
    'folke/which-key.nvim',
    config = function()
      require('core.which-key')
    end,
  },

  {
    'b3nj5m1n/kommentary',
    config = function()
      require('edit.kommentary')
    end,
    event = 'VeryLazy',
  },
})
