-- Performance optimization settings

-- Disable providers we don't use to reduce startup time
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Disable unnecessary built-in plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logipat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- Performance related options
vim.opt.lazyredraw = true          -- Don't redraw screen during macros
vim.opt.synmaxcol = 240            -- Only highlight first 240 columns
vim.opt.updatetime = 100           -- Faster completion and more responsive UI
vim.opt.ttyfast = true             -- Indicates a fast terminal connection
vim.opt.timeoutlen = 500           -- Faster key sequence completion
vim.opt.ttimeoutlen = 10           -- Faster key code sequence recognition
vim.opt.completeopt = 'menuone,noselect' -- Better completion menu

-- Reduce memory usage
vim.opt.hidden = false             -- Don't keep buffers in memory when closed
vim.opt.history = 100              -- Reduce command history
vim.opt.undolevels = 100           -- Reduce undo levels

-- Disable syntax highlighting for large files
vim.api.nvim_create_autocmd({"BufReadPre"}, {
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > 1024 * 1024 then -- 1MB
      vim.cmd("syntax off")
      vim.opt_local.spell = false
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.signcolumn = "no"
    end
  end,
})

-- LSP optimizations
vim.lsp.set_log_level("ERROR") -- Reduce LSP logging

-- Enhanced buffer handling for large files
-- Disable certain features when a large file is detected
vim.api.nvim_create_autocmd({"BufReadPre"}, {
  pattern = "*",
  callback = function(info)
    local max_filesize = 1024 * 1024 -- 1MB
    local ok, stats = pcall(vim.loop.fs_stat, info.match)
    if ok and stats and stats.size > max_filesize then
      vim.b[info.buf].large_file = true
      
      -- Disable various features for large files
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.colorcolumn = "0"
      vim.cmd("syntax clear")
      
    end
  end
})