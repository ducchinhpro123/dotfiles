local lspconfig = require('lspconfig')

-- Configure LSP capabilities for autocompletion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Disable semantic tokens for all language servers
local on_attach = function(client, bufnr)
  -- Disable semantic highlighting
  client.server_capabilities.semanticTokensProvider = nil
end

-- Global mappings
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- C/C++ LSP setup with clangd
lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  single_file_support = true
}

-- Add other language servers as needed
-- For example: Python
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- For TypeScript/JavaScript
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- For Rust
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

