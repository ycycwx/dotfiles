-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- define indent dot here
-- vim.opt.list = true
-- vim.opt.listchars:append('space:⋅')

require('indent_blankline').setup({
  char = '▏',
  show_first_indent_level = false,
  filetype_exclude = {
    'help',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
})
