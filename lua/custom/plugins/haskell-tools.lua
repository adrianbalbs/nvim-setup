return {
  'mrcjkb/haskell-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig'
  },
  version = '^2', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  config = function ()
    vim.g.haskell_tools = {
      hls = {
        on_attach = require('lsp-config').on_attach
      }
    }

    local ht = require('haskell-tools')
    local bufnr = vim.api.nvim_get_current_buf()
    local def_opts = { noremap = true, silent = true, buffer = bufnr, }
    -- haskell-language-server relies heavily on codeLenses,
    -- so auto-refresh (see advanced configuration) is enabled by default
    vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, { desc = "[C]ode [L]ens"})
    -- Hoogle search for the type signature of the definition under the cursor
    vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, { desc = "[H]oogle [S]ignature"})
    -- Evaluate all code snippets
    vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, { desc = "Buffer Eval All"})
    -- Toggle a GHCi repl for the current package
    vim.keymap.set('n', '<leader>rr', ht.repl.toggle, { desc = "Toggle REPL"})
    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set('n', '<leader>rf', function()
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, def_opts)
    vim.keymap.set('n', '<leader>rq', ht.repl.quit, {desc = "Quit REPL"})
  end
}
