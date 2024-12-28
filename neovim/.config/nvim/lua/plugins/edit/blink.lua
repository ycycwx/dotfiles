local custom = require('custom')

return {
  'Saghen/blink.cmp',
  build = 'cargo build --release',
  opts = {
    keymap = {
      -- @see https://cmp.saghen.dev/configuration/keymap.html#keymap
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        'snippet_forward',
        'fallback',
      },
    },
    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
        'lazydev',
      },
      providers = {
        lsp = {
          name = 'LSP',
          fallbacks = {
            'lazydev',
          },
        },
        lazydev = {
          name = 'Development',
          module = 'lazydev.integrations.blink',
        },
      },
    },
    completion = {
      list = {
        selection = function(ctx)
          return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect'
        end,
      },
      menu = {
        border = 'rounded',
        -- Minimum width should be controlled by components
        min_width = 1,
        draw = {
          columns = {
            { 'kind_icon' },
            { 'label', 'label_description', gap = 1 },
            { 'provider' },
          },
          components = {
            provider = {
              text = function(ctx)
                return '[' .. ctx.item.source_name:sub(1, 3):upper() .. ']'
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
        window = {
          border = 'rounded',
          winblend = vim.o.pumblend,
        },
      },
    },
    appearance = {
      nerd_font_variant = 'mono',
      kind_icons = custom.icons.kind,
    },
  },
}
