-----------------------------------------------------------
-- Gitsigns configuration file
-----------------------------------------------------------

-- Plugin: gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim

require('gitsigns').setup()

local map = vim.api.nvim_set_keymap

map(
  'n',
  '<leader>bl',
  [[<cmd>Gitsigns blame_line<cr>]],
  { noremap = true, silent = true }
)
