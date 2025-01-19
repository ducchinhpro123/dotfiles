require('nvim-treesitter.configs').setup({
    ensure_installed = { 'python', 'c', 'cpp', 'html', 'css', 'tsx' },
    highlight = {
        enable = false,
    },
    indent = {
        enable = true, -- Enable language-aware indentation
    },
})
