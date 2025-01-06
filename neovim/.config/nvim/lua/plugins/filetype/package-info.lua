return {
  'vuki656/package-info.nvim',
  -- Disable plugin temporarily. @see: https://github.com/vuki656/package-info.nvim/issues/160
  enabled = false,
  event = {
    'BufRead package.json',
    'BufRead package-lock.json',
  },
  init = function()
    vim.api.nvim_create_autocmd('BufRead', {
      pattern = {
        'package.json',
        'package-lock.json',
      },
      callback = function(args)
        local bufnr = args.buf

        vim.keymap.set('n', '<localleader>s', function()
          require('package-info').show()
        end, { desc = 'Show package versions', buffer = bufnr })
        vim.keymap.set('n', '<localleader>c', function()
          require('package-info').hide()
        end, { desc = 'Hide package versions', buffer = bufnr })
        vim.keymap.set('n', '<localleader>u', function()
          require('package-info').update()
        end, { desc = 'Update package on line', buffer = bufnr })
        vim.keymap.set('n', '<localleader>d', function()
          require('package-info').delete()
        end, { desc = 'Delete package on line', buffer = bufnr })
        vim.keymap.set('n', '<localleader>i', function()
          require('package-info').install()
        end, { desc = 'Install a new package', buffer = bufnr })
        vim.keymap.set('n', '<localleader>p', function()
          require('package-info').change_version()
        end, {
          desc = 'Install a different package version',
          buffer = bufnr,
        })
      end,
    })
  end,
  dependencies = 'MunifTanjim/nui.nvim',
  opts = {
    colors = {
      up_to_date = '#3c4048', -- Text color for up to date package virtual text
      outdated = '#d19a66', -- Text color for outdated package virtual text
    },
    icons = {
      enable = true, -- Whether to display icons
      style = {
        up_to_date = '|  ', -- Icon for up to date packages
        outdated = '|  ', -- Icon for outdated packages
      },
    },
    autostart = true, -- Whether to autostart when `package.json` is opened
    hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
    hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
    package_manager = 'pnpm',
  },
}
