require('options')
require('settings')
require('keymaps')
require('lsp')
require('manager')

local custom = require('custom')
vim.cmd.colorscheme(custom.theme)
