" Vim-plug plugins section
call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'preservim/nerdtree'               " File explorer
Plug 'preservim/nerdcommenter'          " Extended commenting
Plug 'jiangmiao/auto-pairs'             " Auto close brackets

Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'tpope/vim-commentary'             " Easy commenting
Plug 'tpope/vim-sleuth'                 " Extended commenting

" Plug 'lervag/vimtex'

Plug 'andymass/vim-matchup'

Plug 'liuchengxu/vim-which-key'

Plug 'airblade/vim-gitgutter'

Plug 'ycm-core/YouCompleteMe'

" ------ YOU MAY WANT TO DELETE IT -------
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
" ----------------------------------------

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Colorscheme
Plug 'fenetikm/falcon'

" Auto close HTML tag
Plug 'alvan/vim-closetag'

" Initialize plugin system
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader = ","


nnoremap <silent><nowait> <space>e :<C-u>NERDTreeToggle<cr>
nnoremap <space>sf :<C-u>Files<CR>
nnoremap <space>sg :RG<CR>

let $FZF_DEFAULT_COMMAND = 'fd --type f'

"
nnoremap <space>sb :Buffers<CR>
let NERDTreeShowHidden=1

nnoremap <leader>sh :Helptags<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Close all the buffers
map <space>ba :bufdo bd<cr>

" -------------------------- LATEX CONFIG --------------------------
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
" ------------------------------------------------------------------------------

map gf :e <cfile><CR>

filetype plugin indent on
set mouse=v
set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
autocmd BufReadPost,BufNewFile * set nowrap
set nobackup
set autoread
set nowb
set noswapfile
set showmatch                          " Highlight matching brackets
set incsearch                          " Incremental search
set hlsearch                           " Highlight search results
set ignorecase                         " Case insensitive search
set smartcase                          " Case sensitive if uppercase present
set expandtab                          " Use spaces instead of tabs
set shiftwidth=4                       " Size of indent
set tabstop=4                          " Size of tab
set softtabstop=4                      " Size of soft tab
set autoindent                         " Auto indent
set smartindent                        " Smart indent
set wrap                               " Wrap lines
set encoding=utf-8                     " Set encoding
" set fileencoding=utf-8                 " Set file encoding
set ruler                             " Show cursor position
set mouse=a                           " Enable mouse support
set clipboard=unnamedplus             " Use system clipboard
" vnoremap <leader>y "+y
set nowritebackup
set updatetime=300
set signcolumn=yes
set guiheadroom=0
set termguicolors

autocmd FileType java setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab

" Theme settings

set background=dark                    " Set dark background
colorscheme falcon                    " Set colorscheme

autocmd FileType nerdtree nmap <buffer> <Tab> o

:nnoremap <Esc><Esc> :noh<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" For whichKey
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

set timeoutlen=500


" Youcompleteme config
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = '<C-Space>' 
let g:ycm_enable_semantic_highlighting=1
let g:ycm_always_populate_location_list = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_error_symbol = '❌'
let g:ycm_warning_symbol = '⚠️'

set completeopt-=preview
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gi :YcmCompleter GoToImplementation<CR>
nnoremap gD :YcmCompleter GetDoc<CR>
nnoremap rr :YcmCompleter RefactorRename
" nnoremap K :YcmCompleter GetDoc<CR>

nmap [g :lnext<CR>
nmap ]g :lprevious<CR>
let g:ycm_auto_hover = ''
nmap K <plug>(YCMHover)

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc> :w!<CR>
