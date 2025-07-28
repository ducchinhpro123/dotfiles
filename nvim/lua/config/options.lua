-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.opt.guicursor = "a:block"
vim.g.autoformat = false

-- Tab and indentation settings
vim.opt.tabstop = 2         -- Number of visual spaces per TAB
vim.opt.softtabstop = 2     -- Number of spaces in tab when editing
vim.opt.shiftwidth = 2      -- Number of spaces to use for autoindent
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.smartindent = true  -- Smart autoindenting
vim.opt.autoindent = true   -- Copy indent from current line when starting new line
