" =============================================================================
" GENERAL SETTINGS
" =============================================================================
set nobackup
set nowritebackup
set nowb
set noswapfile
set autoread
set mouse=a
set clipboard=unnamedplus             " Use system clipboard
set updatetime=100
set encoding=utf-8
set ruler                             " Show cursor position
set laststatus=2                      " Always show status line
set guiheadroom=0
" =============================================================================
" EDITOR BEHAVIOR
" =============================================================================
set number                             " Show line numbers
set relativenumber                     " Show relative line numbers
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
set signcolumn=no                      " Always show sign column
" File navigation
map gf :e <cfile><CR>
" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" =============================================================================
" APPEARANCE
" =============================================================================
syntax on
set termguicolors
set background=dark                    " Set dark background
if &t_Co == 256 || has('gui_running')
    colorscheme desert256              " High-color scheme
else
    colorscheme desert                 " Low-color scheme
endif
" Set custom background color for all screen elements
function! SetBackgroundColor()
    " Normal text background
    highlight Normal guibg=#000000 ctermbg=234
    " Empty line ~ characters
    highlight EndOfBuffer guibg=#000000 ctermbg=234
    " Non-text areas 
    highlight NonText guibg=#000000 ctermbg=234
    " Line number column
    highlight LineNr guibg=#000000 ctermbg=234
    " Sign column (gutter)
    highlight SignColumn guibg=#000000 ctermbg=234
    " Vertical split
    highlight VertSplit guibg=#000000 ctermbg=234
endfunction
" Apply background color after any colorscheme loads
autocmd ColorScheme * call SetBackgroundColor()
" Ensure background color is applied when Vim starts
autocmd VimEnter * call SetBackgroundColor()
" Status line configuration
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
" Custom highlighting for YCM popup
" Make sure these are after colorscheme loading to override defaults
highlight Pmenu ctermfg=0 ctermbg=252 guifg=#000000 guibg=#d0d0d0
highlight PmenuSel ctermfg=0 ctermbg=242 guifg=#000000 guibg=#666666
highlight PmenuSbar ctermbg=248 guibg=#808080
highlight PmenuThumb ctermbg=15 guibg=#ffffff
highlight YcmErrorSection ctermbg=52 guibg=#5F0000
highlight YcmWarningSection ctermbg=58 guibg=#5F5F00
highlight link YcmErrorSign Error
highlight link YcmWarningSign Todo
" Override the hover popup colors specifically
autocmd FileType c,cpp,python,java,rust,javascript,typescript,dart
    \ highlight! link YcmHover Normal
" NORD INSPIRED THEME (cool blue tones)
highlight Pmenu ctermfg=255 ctermbg=237 guifg=#E5E9F0 guibg=#3B4252
highlight PmenuSel ctermfg=235 ctermbg=111 guifg=#2E3440 guibg=#81A1C1
highlight PmenuSbar ctermbg=237 guibg=#4C566A
highlight PmenuThumb ctermbg=111 guibg=#81A1C1
highlight YcmErrorSection guibg=#3B4252 guifg=#BF616A
highlight YcmWarningSection guibg=#3B4252 guifg=#EBCB8B
highlight YcmHover guibg=#434C5E guifg=#ECEFF4 gui=NONE
" Override the hover popup colors specifically for certain filetypes
autocmd FileType c,cpp,python,java,rust,javascript,typescript,dart
    \ highlight! link YcmHover Normal
" =============================================================================
" KEY MAPPINGS
" =============================================================================
" exit mode
inoremap jj <ESC>
" Leader key setup
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader = ","
" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Clear search highlighting with Esc
:nnoremap <Esc><Esc> :noh<CR>
" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w!<CR>
inoremap <C-c> <Esc>
" Move lines up/down with Alt+j/k
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" nnoremap <M-k> :m .-2<CR>==
" inoremap <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <M-k> :m '<-2<CR>gv=gv
" nnoremap <M-j> :m .+1<CR>==
" inoremap <M-j> <Esc>:m .+1<CR>==gi
" vnoremap <M-j> :m '>+1<CR>gv=gv
" Buffer management
map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <space>ba :bufdo bd<cr>
" =============================================================================
" PLUGIN MANAGEMENT
" =============================================================================
call plug#begin('~/.vim/plugged')
" File navigation and UI
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-gitgutter'
" Code editing helpers
Plug 'preservim/nerdcommenter'          " Extended commenting
Plug 'jiangmiao/auto-pairs'             " Auto close brackets
Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andymass/vim-matchup'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'alvan/vim-closetag'              " Auto close HTML tag
" Code completion and intelligence
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --ts-completer --java-completer --rust-completer' }
" Language support
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" Formatting and appearance
Plug 'sbdchd/neoformat'
Plug 'alligator/accent.vim'
Plug 'sstallion/vim-wtf'
Plug 'KevinGoodsell/vim-xterm-colors'
" LaTeX support
"Plug 'lervag/vimtex'
call plug#end()
runtime! plugins/*.vim
" =============================================================================
" NERDTREE CONFIGURATION
" =============================================================================
let NERDTreeShowHidden=1
nnoremap <silent><nowait> <space>e :<C-u>NERDTreeToggle<cr>
autocmd FileType nerdtree nmap <buffer> <Tab> o
" =============================================================================
" FZF CONFIGURATION
" =============================================================================
let $FZF_DEFAULT_COMMAND = 'find . -type f ! -path "*/\.git/*" ! -path "*/node_modules/*" ! -path "*/vendor/*" ! -path "*/build/*" ! -path "*/dist/*" ! -path "*/target/*" '
nnoremap <space>sf :<C-u>Files<CR>
nnoremap <space>sg :RG<CR>
nnoremap <space>sb :Buffers<CR>
" =============================================================================
" WHICH-KEY CONFIGURATION
" =============================================================================
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" =============================================================================
" NEOFORMAT CONFIGURATION
" =============================================================================
let g:neoformat_enabled_python = ['black', 'autopep8', 'yapf']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:noeformat_enabled_cpp = ['clangformat']
let g:noeformat_enabled_java = ['clangformat']
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['-style=file'],
    \ 'stdin': 1,
    \ }
" Define a Java-specific clang-format configuration for 4-space indentation
let g:neoformat_java_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['-style={BasedOnStyle: Google, IndentWidth: 4, TabWidth: 4}'],
    \ 'stdin': 1,
    \ }
autocmd FileType java setlocal shiftwidth=4 tabstop=4 expandtab
nnoremap <silent> <space>cf :Neoformat<CR>
vnoremap <silent> <space>cf :Neoformat<CR>
" =============================================================================
" YOUCOMPLETEME CONFIGURATION
" =============================================================================
inoremap <C-c> <Esc>:YcmForceCompileAndDiagnostics<CR>
let g:ycm_always_populate_location_list = 1
let g:ycm_update_diagnostics_in_insert_mode = 1
let g:cpp_latest_standard = 'c++20'
" let g:ycm_clangd_binary_path = '/usr/bin/clangd-15'
" Core settings
" let g:ycm_global_ycm_extra_conf = '~/programming/cpp/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '/home/t/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" Preview window behavior
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview
" Trigger and navigation keys
let g:ycm_auto_trigger = 0       " Disable auto-completion
" let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
let g:ycm_auto_diagnostic_delay = 300
" Fix Ctrl+Space for manual completion trigger
let g:ycm_key_invoke_completion = '<C-Space>'
" Map Ctrl+M as an alternative way to navigate completion menu
" inoremap <expr> <C-m> pumvisible() ? "\<C-n>" : "\<CR>"
" Disable hover features
let g:ycm_auto_hover = ''
nmap <silent> K <plug>(YCMHover)
let g:ycm_disable_signature_help = 1
" Diagnostics display
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
" Navigation keymaps
nnoremap <silent> gd :YcmCompleter GoTo<CR>
nnoremap <silent> gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> gi :YcmCompleter GoToImplementation<CR>
nnoremap <silent> gy :YcmCompleter GoToType<CR>
nnoremap <silent> <leader>rn :YcmCompleter RefactorRename<Space>
nnoremap <silent> <leader>f :YcmCompleter Format<CR>
nnoremap <silent> <leader>qf :YcmCompleter FixIt<CR>
nnoremap <silent> <space>d :YcmDiags<CR>
nnoremap <silent> [g :YcmDiagnosticsPrevious<CR>
nnoremap <silent> ]g :YcmDiagnosticsNext<CR>
" Additional configuration for Rust
let g:ycm_rust_src_path = expand('~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library')
let g:ycm_language_server = [
  \   {
  \     'name': 'dart',
  \     'cmdline': ['dart', 'language-server', '--client-id', 'vim'],
  \     'filetypes': ['dart'],
  \     'project_root_files': ['pubspec.yaml', '.git']
  \   },
  \   {
  \     'name': 'rust',
  \     'cmdline': ['rust-analyzer'],
  \     'filetypes': ['rust'],
  \     'project_root_files': ['Cargo.toml', '.git']
  \   },
  \   {
  \     'name': 'javascript',
  \     'cmdline': ['typescript-language-server', '--stdio'],
  \     'filetypes': ['javascript', 'javascriptreact'],
  \     'project_root_files': ['package.json', 'jsconfig.json', '.git']
  \   },
  \   {
  \     'name': 'typescript',
  \     'cmdline': ['typescript-language-server', '--stdio'],
  \     'filetypes': ['typescript', 'typescriptreact', 'javascript', 'javascriptreact'],
  \     'project_root_files': ['tsconfig.json', 'package.json', '.git']
  \   }
  \ ]
" =============================================================================
" LATEX CONFIGURATION
" =============================================================================
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
" =============================================================================
" FILETYPE-SPECIFIC SETTINGS
" =============================================================================
filetype plugin indent on
autocmd FileType dart setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
" =============================================================================
" CUSTOM KEY MAPPINGS FOR COMPLETION
" =============================================================================
" Change the default completion acceptance key (Ctrl+y) to Ctrl+m
let g:ycm_key_list_stop_completion = ['<C-m>']
" If you still want both to work (optional)
" inoremap <expr> <C-m> pumvisible() ? "\<C-y>" : "\<CR>"
" Alternatively, for more direct control with pure mapping:
inoremap <expr> <C-m> pumvisible() ? '<C-y>' : '<CR>'
