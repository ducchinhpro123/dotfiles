-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Language-specific indentation settings
-- 4 spaces for languages that commonly use 4-space indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "java",
    "rust", 
    "c",
    "cpp",
    "python",
    "go",
    "php", 
    "cs",           -- C#
    "kotlin",
    "scala",
    "dart",
    "swift",
    "perl",
    "ruby",
    "cmake",
    "make",
    "dockerfile",
    "sql",
    "xml",
    "groovy",
    "gradle",
  },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
  desc = "Set 4-space indentation for specific languages",
})
