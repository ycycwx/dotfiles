return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  dependencies = {
    {
      'junegunn/fzf',
    },
  },
  opts = {
    auto_resize_height = true,
    preview = {
      border = 'rounded',
      show_scroll_bar = false,
    },
  },
}