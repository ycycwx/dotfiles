return {
  'aserowy/tmux.nvim',
  cond = vim.env.TMUX ~= nil,
  opts = {},
  event = 'VeryLazy',
  -- TODO: It seems there exist conflicts with some shortcuts?
  enabled = false,
}
