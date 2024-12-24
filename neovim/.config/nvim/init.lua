local custom = require('custom')

require('settings')
require('keymaps')
require('manager')

vim.cmd.colorscheme(custom.theme)
