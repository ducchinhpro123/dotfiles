local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = true
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
end

return require('packer').startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require('plugins.config.nvimtree')
        end
    }

    -- Auto pairs
    use {
        'echasnovski/mini.pairs',
        config = function()
            require('mini.pairs').setup({})
        end
    }

    use 'rktjmp/lush.nvim'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.config.telescope')
        end
    }

    -- LSP and autocompletion
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.config.lsp')
        end
    }
    
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require('plugins.config.cmp')
        end
    }

    -- Syntax highlighting using traditional Vim syntax files
    use 'rust-lang/rust.vim'       -- Rust
    use 'pangloss/vim-javascript'  -- JavaScript
    use 'leafgarland/typescript-vim' -- TypeScript
    use 'maxmellon/vim-jsx-pretty' -- JSX/React
    use 'python-mode/python-mode'  -- Python
    use 'ap/vim-css-color'         -- CSS color preview

    use 'sbdchd/neoformat'

    use {
        'nvim-flutter/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    }

    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

