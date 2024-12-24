return {
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
    'folke/which-key.nvim',
    config = function()
      require('core.which-key')
    end,
    event = 'VeryLazy',
  },

  {
    'aserowy/tmux.nvim',
    config = function()
      require('tool.tmux')
    end,
    event = 'VeryLazy',
    -- TODO: check performance issue
    enabled = false,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('interface.indent-blankline')
    end,
    event = 'VeryLazy',
  },

  {
    'RRethy/vim-illuminate',
    config = function()
      require('interface.illuminate')
    end,
    -- TODO: has any more usage?
    enabled = false,
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('edit.autopairs')
    end,
    event = 'VeryLazy',
  },

  {
    'mfussenegger/nvim-lint',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        svelte = { 'eslint_d' },
        python = { 'pylint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      -- vim.keymap.set('n', '<leader>f', function()
      --   lint.try_lint()
      -- end, { desc = 'Trigger linting for current file' })
    end,
    enabled = false,
  },

  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('core.conform')
    end,
  },

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
    'onsails/lspkind-nvim',
    config = function()
      require('interface.lspkind')
    end,
    event = 'VeryLazy',
  },

  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require('interface.fidget')
    end,
    event = 'LspAttach',
  },

  -- {
  --   'tzachar/cmp-tabnine',
  --   build = './install.sh',
  --   config = function()
  --     require('edit.tabnine')
  --   end,
  --   dependencies = { 'hrsh7th/nvim-cmp' },
  --   event = 'VeryLazy',
  -- },

  {
    'utilyre/barbecue.nvim',
    config = function()
      require('interface.barbecue')
    end,
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'kyazdani42/nvim-web-devicons',
    },
    event = 'VeryLazy',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('tool.gitsigns')
    end,
    dependencies = 'nvim-lua/plenary.nvim',
    event = 'VeryLazy',
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
    'phaazon/hop.nvim',
    config = function()
      require('efficiency.hop')
    end,
    branch = 'v2',
    event = 'VeryLazy',
  },

  {
    'mfussenegger/nvim-treehopper',
    config = function()
      require('efficiency.treehopper')
    end,
    event = 'VeryLazy',
  },

  {
    'ethanholz/nvim-lastplace',
    config = function()
      require('efficiency.lastplace')
    end,
  },

  {
    'Shatur/neovim-session-manager',
    config = function()
      require('efficiency.session-manager')
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
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

  {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('tool.toggleterm')
    end,
    version = 'v2.*',
    keys = {
      { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = 'Toggle Term' },
    },
  },

  {
    'stevearc/aerial.nvim',
    config = function()
      require('tool.aerial')
    end,
    keys = {
      { '<leader>a', '<cmd>AerialToggle<CR>', desc = 'Outline' },
    },
  },

  {
    'wakatime/vim-wakatime',
    event = 'VeryLazy',
  },

  { 'gpanders/editorconfig.nvim' },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('interface.notify')
    end,
    event = 'VeryLazy',
  },

  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('edit.snip')
    end,
    event = 'VeryLazy',
  },

  {
    'b3nj5m1n/kommentary',
    config = function()
      require('edit.kommentary')
    end,
    event = 'VeryLazy',
  },

  {
    'akinsho/nvim-bufferline.lua',
    config = function()
      require('interface.bufferline')
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    event = 'VeryLazy',
  },

  {
    'folke/noice.nvim',
    config = function()
      require('interface.noice')
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    event = 'VeryLazy',
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  {
    'folke/todo-comments.nvim',
    config = function()
      require('interface.todo-comments')
    end,
    event = 'VeryLazy',
  },

  {
    'b0o/SchemaStore.nvim',
    config = function()
      require('language.schema-store')
    end,
    ft = {
      'json',
      'jsonc',
    },
  },

  {
    'fladson/vim-kitty',
    event = { 'BufRead kitty.conf' },
  },
}
