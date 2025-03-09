local keymap = vim.keymap

keymap.set("n", "]g", vim.diagnostic.goto_next)
keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- Leader key
vim.g.mapleader = ' '

-- Window navigation
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Save and quit
keymap.set('n', '<C-s>', ':w<CR>')
keymap.set('i', '<C-s>', '<Esc>:w<CR>')
keymap.set('n', '<leader>q', ':q<CR>')
keymap.set('n', '<leader>qq', ':q!<CR>')

-- Clear search highlights
keymap.set('n', '<Esc><Esc>', ':noh<CR>')

-- File explorer - use Lua function directly instead of command
keymap.set('n', '<leader>e', function()
    require('nvim-tree.api').tree.toggle()
end, { desc = "Toggle NvimTree" })

-- Fuzzy finder (Telescope)
keymap.set('n', '<leader>sf', ':Telescope find_files<CR>')
keymap.set('n', '<leader>sg', ':Telescope live_grep<CR>')
keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')


-- LSP keybindings
keymap.set('n', 'gd', vim.lsp.buf.definition)
keymap.set('n', 'gr', vim.lsp.buf.references)
keymap.set('n', 'gi', vim.lsp.buf.implementation)
keymap.set('n', 'K', vim.lsp.buf.hover)
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
keymap.set('n', '<leader>f', vim.lsp.buf.format)

