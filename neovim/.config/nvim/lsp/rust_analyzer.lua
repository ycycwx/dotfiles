---@type vim.lsp.Config
return {
  handlers = {
    ['experimental/serverStatus'] = function(err, result, ctx)
      if err or not result or not result.quiescent then
        return
      end

      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if not client or not client:supports_method('textDocument/inlayHint') then
        return
      end

      -- Initial hint requests can be cancelled while the workspace is loading.
      for bufnr in pairs(client.attached_buffers) do
        if vim.api.nvim_buf_is_loaded(bufnr) and vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }) then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end
    end,
  },
}
