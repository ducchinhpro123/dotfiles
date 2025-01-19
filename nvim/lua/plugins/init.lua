local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
end

return require('packer').startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- File explorer
    use 'nvim-tree/nvim-tree.lua'

    -- Auto pairs
    use 'echasnovski/mini.pairs'

    use {
        'nvim-treesitter/nvim-treesitter',
    }

    -- Colorscheme
    use 'metalelf0/jellybeans-nvim' 
    use 'rktjmp/lush.nvim'

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }

    -- LSP and autocompletion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'


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

    require('plugins.config.lsp') 
    require('plugins.config.cmp')
    require('plugins.config.treesitter')
    require('mini.pairs').setup({})

end)

