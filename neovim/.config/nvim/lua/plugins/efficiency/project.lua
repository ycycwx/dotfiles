return {
  'ofseed/project.nvim',
  event = 'VeryLazy',
  main = 'project_nvim',
  opts = {
    ignore_lsp = { 'jsonls', 'yamlls', 'taplo' },
  },
}
