return {
  'mrcjkb/haskell-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig'
  },
  version = '^2', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  config = function (_, opts)
    vim.g.haskell_tools = {
      hls = {
        on_attach = require('lsp-config').on_attach
      }
    }
  end
}
