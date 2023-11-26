-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmpa

local ok, cmp = pcall(require, 'cmp')
if not ok then
  vim.notify('Could not load cmp')
  return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  vim.notify('Could not load luasnip')
  return
end

local ok, lspkind = pcall(require, 'lspkind')
if not ok then
  vim.notify('Could not load lspkind')
  return
end

local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  cmp_tabnine = '[TN]',
  path = '[Path]',
}

cmp.setup({
  -- load snippet support
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- completion settings
  completion = {
    --completeopt = 'menu,menuone,noselect'
    keyword_length = 2,
  },

  -- key mapping
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    -- Tab mapping
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        -- work with copilot
        -- @see https://github.com/hrsh7th/nvim-cmp/issues/459#issuecomment-957140674
        -- local copilot_keys = vim.fn['copilot#Accept']()
        -- if copilot_keys ~= '' then
        --   vim.api.nvim_feedkeys(copilot_keys, 'i', true)
        -- else
        --   fallback()
        -- end
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },

  -- load sources, see: https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'cmp_tabnine' },
  },

  formatting = {
    format = function(entry, vim_item)
      -- if you have lspkind installed, you can use it like
      -- in the following line:
      vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = 'symbol' })
      vim_item.menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        local detail = (entry.completion_item.data or {}).detail
        vim_item.kind = ''
        if detail and detail:find('.*%%.*') then
          vim_item.kind = vim_item.kind .. ' ' .. detail
        end

        if (entry.completion_item.data or {}).multiline then
          vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
        end
      end
      local maxwidth = 80
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      return vim_item
    end,
  },
})
