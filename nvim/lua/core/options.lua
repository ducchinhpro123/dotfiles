vim.opt.guicursor = 'n-v-c-sm:block,i-ci-ve:block,r-cr-o:block'
vim.opt.number = true               -- Show line numbers
vim.opt.relativenumber = true       -- Show relative line numbers
vim.opt.tabstop = 4                 -- Size of a tab
vim.opt.shiftwidth = 4              -- Size of an indent
vim.opt.expandtab = true            -- Use spaces instead of tabs
vim.opt.autoindent = true           -- Auto indent
vim.opt.mouse = 'a'                 -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'   -- Use system clipboard
vim.opt.ignorecase = true           -- Case-insensitive search
vim.opt.smartcase = true            -- Case-sensitive search if uppercase present
vim.opt.wrap = false                -- Disable line wrapping
vim.opt.termguicolors = true        -- Enable true color support
vim.opt.signcolumn = 'yes'          -- Always show the sign column
vim.opt.updatetime = 300            -- Faster completion
vim.opt.splitright = true           -- Open vertical splits to the right
vim.opt.splitbelow = true           -- Open horizontal splits below

-- Disable swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Load colorscheme
vim.cmd('colorscheme koehler')
vim.cmd('highlight Normal guibg=#101010')

