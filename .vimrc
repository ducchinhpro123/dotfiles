" Vim-plug plugins section
call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'preservim/nerdtree'               " File explorer
Plug 'preservim/nerdcommenter'          " Extended commenting
Plug 'jiangmiao/auto-pairs'             " Auto close brackets

Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'tpope/vim-commentary'             " Easy commenting
Plug 'tpope/vim-sleuth'                 " Extended commenting

Plug 'rust-lang/rust.vim'

" Plug 'sheerun/vim-polyglot'             " Language pack
Plug 'liuchengxu/vim-which-key'

" ------ YOU MAY WANT TO DELETE IT -------
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" ----------------------------------------

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" let mapleader = ","

nnoremap <silent><nowait> <space>e :<C-u>NERDTreeToggle<cr>
" nnoremap <silent><nowait> <space>sf :<C-u>Files<CR>
nnoremap <space>sf :<C-u>Files<CR>
nnoremap <space>sg :GFiles<CR>
nnoremap <space>sb :Buffers<CR>
let NERDTreeShowHidden=1


" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" nnoremap <leader>sb :Buffers<CR>
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

map <space>l :bnext<cr>
map <space>h :bprevious<cr>

" Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" ------------- YCM CONFIG -------------
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_enable_semantic_highlighting=1
let g:ycm_key_list_stop_completion = ['<C-m>']

nnoremap gd :YcmCompleter GoTo<CR>
nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <leader>ca :YcmCompleter FixIt<CR>
nnoremap [g :YcmDiags previous<CR>
nnoremap ]g :YcmDiags next<CR>

" --------------------------------------

set mouse=v

" Basic settings
syntax enable                           " Enable syntax highlighting
set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
" set cursorline                         " Highlight current line
" set nocursorline
set nobackup
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

" Theme settings
set background=dark                    " Set dark background
colorscheme koehler                    " Set colorscheme
" let g:solarized_termcolors=256

" Key mappings
" let mapleader = ","                    " Set leader key to comma

" NERDTree mappings
" nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <silent><nowait> <space>e :<C-u>NERDTreeToggle<cr>

" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
autocmd FileType nerdtree nmap <buffer> <Tab> o

" nnoremap <C-f> :NERDTreeFind<CR>

" nnoremap <leader>f :NERDTreeFind<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc> :w!<CR>

" For whichKey
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
"highlight WhichKey      ctermfg=blue     ctermbg=black guifg=#87afff guibg=#1c1c1c
"highlight WhichKeyGroup ctermfg=yellow   ctermbg=black guifg=#ffd700 guibg=#1c1c1c
"highlight WhichKeyDesc  ctermfg=white    ctermbg=black guifg=#ffffff guibg=#1c1c1c

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

set timeoutlen=500
