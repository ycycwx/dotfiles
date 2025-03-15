return {
  'editorconfig/editorconfig-vim',
  ft = '*',
  init = function()
    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
      pattern = '*',
      callback = function()
        local colorcolumn = vim.g.EditorConfig_max_line_length
        if colorcolumn and colorcolumn ~= '' then
          vim.opt.colorcolumn = colorcolumn
        end
      end,
    })
  end,
}
