-- Script to remove Treesitter

-- Delete any remaining Treesitter parsers
local packer_compiled = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
if vim.fn.filereadable(packer_compiled) == 1 then
  vim.cmd('silent !rm ' .. packer_compiled)
end

-- Clean the Treesitter directory
local treesitter_dir = vim.fn.stdpath('data') .. '/site/pack/packer/start/nvim-treesitter'
if vim.fn.isdirectory(treesitter_dir) == 1 then
  vim.cmd('silent !rm -rf ' .. treesitter_dir)
end

-- Run Packer sync
vim.cmd('PackerSync')

print("Treesitter removed. You can delete this file after executing it once with ':luafile %'")
