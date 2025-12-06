return {
  'ycycwx/react-compiler-badge.nvim',
  build = 'npm install', -- Installs dependencies for analyzer.js
  event = {
    'BufReadPost *.ts',
    'BufReadPost *.tsx',
    'BufReadPost *.js',
    'BufReadPost *.jsx',
  },
}
