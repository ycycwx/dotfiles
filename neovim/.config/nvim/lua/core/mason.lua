local ok, mason = pcall(require, 'mason')
if not ok then
  vim.notify('Could not load mason')
end

local custom = require('custom')

mason.setup({
  ui = {
    border = custom.border,
  },
})

vim.keymap.set('n', '<leader>om', '<Cmd>Mason<CR>', { silent = true, desc = 'Package manager' })
