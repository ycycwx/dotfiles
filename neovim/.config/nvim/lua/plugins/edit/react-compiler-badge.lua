return {
  'ycycwx/react-compiler-badge.nvim',
  build = 'npm ci', -- Installs dependencies for analyzer.js
  event = {
    'BufReadPost *.ts',
    'BufReadPost *.tsx',
    'BufReadPost *.js',
    'BufReadPost *.jsx',
  },
}
