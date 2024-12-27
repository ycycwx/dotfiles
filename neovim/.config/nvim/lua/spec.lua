return {
  { 'tanvirtin/monokai.nvim' },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('colorscheme.catppuccin')
    end,
    build = ':CatppuccinCompile',
    event = 'VeryLazy',
  },

  {
    'folke/tokyonight.nvim',
    config = function()
      require('colorscheme.tokyonight')
    end,
    event = 'VeryLazy',
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('colorscheme.rose-pine')
    end,
    event = 'VeryLazy',
  },

  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('colorscheme.nightfox')
    end,
    event = 'VeryLazy',
  },

  {
    'navarasu/onedark.nvim',
    config = function()
      require('colorscheme.onedark')
    end,
    event = 'VeryLazy',
  },

  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('colorscheme.gruvbox')
    end,
    event = 'VeryLazy',
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
    event = 'InsertEnter',
  },

  {
    'tzachar/cmp-tabnine',
    enabled = false,
    build = './install.sh',
    config = function()
      require('edit.tabnine')
    end,
    dependencies = { 'hrsh7th/nvim-cmp' },
    event = 'VeryLazy',
  },
}
