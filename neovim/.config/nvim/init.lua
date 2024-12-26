local custom = require('custom')

require('settings')
require('keymaps')
require('lsp')
require('manager')

vim.cmd.colorscheme(custom.theme)
