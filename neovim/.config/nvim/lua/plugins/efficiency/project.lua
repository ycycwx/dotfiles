return {
  'ofseed/project.nvim',
  event = 'VeryLazy',
  main = 'project_nvim',
  opts = {
    -- Manual mode doesn't automatically change your root directory, so you have
    -- the option to manually do so using `:ProjectRoot` command.
    manual_mode = true,

    -- Methods of detecting the root directory.
    -- Allowed values: **"lsp"**, **"pattern"**.
    -- All detection methods are enabled by default.
    -- NOTE: lsp detection will automatically detect root directory based on lsp server,
    -- which may cause the root directory to jump to the parent directory.
    detection_methods = { 'pattern' },

    ignore_lsp = { 'jsonls', 'yamlls', 'taplo' },
  },
}
