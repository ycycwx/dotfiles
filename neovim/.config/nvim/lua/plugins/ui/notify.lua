local custom = require('custom')

return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  opts = function()
    local stages_util = require('notify.stages.util')
    local direction = stages_util.DIRECTION.BOTTOM_UP

    return {
      render = 'minimal',

      -- Modified from "static"
      stages = {
        function(state)
          local next_height = state.message.height + 2
          local next_row = stages_util.available_slot(state.open_windows, next_height, direction)
          if not next_row then
            return nil
          end

          -- Avoid overlapping with the statusline
          if vim.tbl_isempty(state.open_windows) then
            next_row = next_row - 1
          end

          return {
            relative = 'editor',
            anchor = 'NE',
            width = state.message.width,
            height = state.message.height,
            col = vim.opt.columns:get(),
            row = next_row,
            border = custom.border,
            style = 'minimal',
          }
        end,
        function()
          return {
            col = vim.opt.columns:get(),
            time = true,
          }
        end,
      },
    }
  end,
}
