local lspconfig = require('lspconfig')

-- Enable LSP for specific languages
lspconfig.ts_ls.setup({})  -- TypeScript/JavaScript
lspconfig.pyright.setup({})   -- Python
lspconfig.clangd.setup({})    -- C/C++

lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

