-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 300 })
    end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd('normal! g\'"')
        end
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'javascript',
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'typescript',
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end,
})
