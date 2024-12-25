local custom = require('custom')

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    shell = vim.uv.os_uname().sysname == 'Windows_NT' and 'pwsh' or 'zsh',
    float_opts = {
      border = custom.border,
    },
    winbar = {
      enabled = true,
    },
  },
  keys = {
    { '<C-\\>' },
    {
      '<leader>tt',
      '<Cmd>ToggleTermToggleAll<CR>',
      mode = 'n',
      desc = 'All Terminal',
    },
  },
}
