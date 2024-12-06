return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = ':TSUpdate',
  opts = {
    parser_install_dir = vim.fs.joinpath(vim.fn.stdpath('data'), 'site'),
    ensure_installed = 'all',
    highlight = {
      enable = true,
      -- Should be controlled by vimtex
      disable = { 'latex' },
    },
    indent = {
      enable = true,
    },
  },
}
