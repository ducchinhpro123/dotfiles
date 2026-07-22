" =============================================================================
" PLUGIN MANAGEMENT
" =============================================================================
call plug#begin('~/.vim/plugged')

" UI & Navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'MattesGroeger/vim-bookmarks'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing enhancements
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'alvan/vim-closetag'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Motion & Search
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'

" Code completion & LSP
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

" Syntax & Languages
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'lumiliet/vim-twig'

" Appearance
Plug 'tpope/vim-vividchalk'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'Yggdroot/indentLine'

call plug#end()

" =============================================================================
" GENERAL SETTINGS
" =============================================================================
set nobackup
set nowritebackup
set noswapfile
set autoread                          " Auto-reload files when changed externally
set mouse=a
set clipboard=unnamedplus           " Use system clipboard
set updatetime=200
set encoding=utf-8
set ruler                             " Show cursor position
set laststatus=2                      " Always show status line
set guiheadroom=0
set ttyfast
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" =============================================================================
" EDITOR BEHAVIOR
" =============================================================================
set number                            " Show line numbers
set relativenumber                    " Show relative line numbers
set showmatch                         " Highlight matching brackets
set incsearch                         " Incremental search
set hlsearch                          " Highlight search results
set ignorecase                        " Case insensitive search
set smartcase                         " Case sensitive if uppercase present
set expandtab                         " Use spaces instead of tabs
set shiftwidth=4                      " Size of indent
set tabstop=4                         " Size of tab
set softtabstop=4                     " Size of soft tab
set autoindent                        " Auto indent
set smartindent                       " Smart indent
set wrap                              " Wrap lines
set signcolumn=yes
set list
set listchars=tab:▸\ ,trail:·,nbsp:␣ " Define how whitespace is shown

" Persistent Undo
if !isdirectory($HOME . '/.vim/undodir')
    call system('mkdir -p ' . $HOME . '/.vim/undodir')
endif
set undofile                          " Save undo history
set undodir=~/.vim/undodir            " Directory for undo files

" File navigation
map gf :e <cfile><CR>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" =============================================================================
" LEADER & KEY MAPPINGS
" =============================================================================
" Leader key setup
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader = ","

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w!<CR>

" Clear search highlighting
nnoremap <F3> :set hlsearch!<CR>

" Exit insert mode with Ctrl+C
inoremap <C-c> <Esc>

" Move lines up/down with Alt+j/k
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-k> :m .-2<CR>==
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-k> :m '<-2<CR>gv=gv
nnoremap <M-j> :m .+1<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" =============================================================================
" APPEARANCE & COLORS
" =============================================================================
syntax enable
set termguicolors
set t_Co=256                          " Enable 256 colors
set background=dark                   " Set dark background

" Colorscheme
colorscheme vividchalk

" Fix colors in tmux/screen
if &term =~ '256color'
    set t_ut=
endif

" Git diff colors (used by fugitive)
highlight diffAdded    guifg=#009900 ctermfg=2
highlight diffChanged guifg=#bbbb00 ctermfg=3
highlight diffRemoved guifg=#ff2222 ctermfg=1


" Sign column and background
highlight SignColumn guibg=#181818 ctermbg=234
hi Normal guibg=NONE ctermbg=NONE

" Statusline
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*=%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

autocmd ColorScheme * hi User1 guifg=#eea040 guibg=#222222
autocmd ColorScheme * hi User2 guifg=#dd3333 guibg=#222222
autocmd ColorScheme * hi User3 guifg=#ff66ff guibg=#222222
autocmd ColorScheme * hi User4 guifg=#a0ee40 guibg=#222222
autocmd ColorScheme * hi User5 guifg=#eeee40 guibg=#222222

" =============================================================================
" PLUGIN CONFIGURATIONS
" =============================================================================

" --- vim-fugitive ---
nmap <Leader>hp :Gdiff<CR>

" --- vim-gitgutter ---
" GitGutter custom colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" --- vim-easymotion ---
nmap s <Plug>(easymotion-overwin-f2)
nmap f <Plug>(easymotion-overwin-f)

" --- incsearch.vim ---
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" --- vim-startify ---
" Returns all modified files of the current git repo
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
      \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" --- NERDTree ---
let NERDTreeShowHidden=1
nnoremap <silent><nowait> <space>e :<C-u>NERDTreeToggle<cr>
autocmd FileType nerdtree nmap <buffer> <Tab> o

" --- FZF ---
let $FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
nnoremap <C-p> :Files!<CR>
nnoremap <space>sg :RG!<CR>
nnoremap <space>sb :Buffers<CR>

" --- indentLine ---
let g:indentLine_char = '┊'
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_setColors = 1
highlight IndentLine guifg=#3b4048 ctermfg=238

" --- vim-closetag ---
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.vue,*.svelte,*.razor,*.cshtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.razor,*.cshtml'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx,typescript.tsx,vue,svelte,razor'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,typescript.tsx,razor'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'razor': 'razorRegion,htmlRegion',
    \ }
let g:closetag_emptyTags_caseSensitive = 1

" --- CoC (Completion Engine) ---
let g:coc_filetype_map = {
  \ 'ino': 'cpp',
  \ }
let g:vim_svelte_plugin_use_typescript = 1
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-clangd',
  \ 'coc-rust-analyzer',
  \ 'coc-flutter',
  \ 'coc-go',
  \ 'coc-svelte',
  \ 'coc-html',
  \ 'coc-phpls',
  \ 'coc-css',
  \ '@yaegassy/coc-volar',
  \ 'coc-java',
  \ 'coc-highlight',
  \ '@yaegassy/coc-tailwindcss3'
  \ ]

" Show documentation on K
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
    if coc#float#has_float()
        call coc#float#jump()
    elseif CocAction('hasProvider', 'hover')
        try
            call CocActionAsync('doHover')
        catch
            call CocActionAsync('definitionHover')
        endtry
    else
        call feedkeys('K', 'in')
    endif
endfunction

" CoC key mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gu <Plug>(coc-references-used)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)
nmap <leader>ca <Plug>(coc-codeaction-cursor)
xmap <leader>ca <Plug>(coc-codeaction-selected)

" CoC completion
inoremap <silent><expr> <C-m> coc#pum#visible() ? coc#pum#confirm() : "\<C-m>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#select_confirm() : "\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <silent><expr> <C-Space> coc#refresh()
autocmd CursorHold * silent call CocActionAsync('highlight')

" CoC highlight colors
highlight CocHighlightText  guibg=#3e4452 gui=bold
highlight CocHighlightRead  guibg=#3e4452 gui=bold
highlight CocHighlightWrite guibg=#3e4452 gui=bold

" =============================================================================
" FILETYPE SETTINGS
" =============================================================================
filetype plugin on
filetype plugin indent on

" JSON comments
autocmd FileType json syntax match Comment +\/\/.$+

" JavaScript/TypeScript/React
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Svelte
autocmd FileType svelte setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Razor/CSHTML
autocmd BufNewFile,BufRead *.razor set filetype=razor
autocmd BufNewFile,BufRead *.cshtml set filetype=razor
autocmd FileType razor setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType razor setlocal commentstring=@*\%s*@

" C#
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" C++/Arduino
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" =============================================================================
" GVIM SPECIFIC
" =============================================================================
set guioptions -=m
set guioptions -=T

" =============================================================================
" EXTERNAL PLUGIN CONFIGS
" =============================================================================
runtime! plugins/*.vim
