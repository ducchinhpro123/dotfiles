" =============================================================================
" PLUGIN MANAGEMENT
" =============================================================================
call plug#begin('~/.vim/plugged')
" Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'

" File navigation and UI
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'alvan/vim-closetag'

Plug 'jiangmiao/auto-pairs'             " Auto close brackets
Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'lumiliet/vim-twig'

Plug 'MattesGroeger/vim-bookmarks'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'mhinz/vim-startify'
Plug 'Lokaltog/vim-distinguished'

Plug 'tpope/vim-vividchalk'


Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'HerringtonDarkholme/yats.vim'

Plug 'lervag/vimtex'
Plug 'ycm-core/YouCompleteMe'

call plug#end()


set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|\.venv)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

" =============================================================================
" DASHBOARD
" =============================================================================

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
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

" =============================================================================
" GENERAL SETTINGS
" =============================================================================
set nobackup
set nowritebackup
set noswapfile
set autoread                          " Auto-reload files when changed externally
set mouse=a
set clipboard=unnamedplus             " Use system clipboard
set updatetime=10
set encoding=utf-8
set ruler                             " Show cursor position
set laststatus=2                      " Always show status line
set guiheadroom=0

set ttyfast

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
set signcolumn=yes

" Persistent Undo
if !isdirectory($HOME . '/.vim/undodir')
    call system('mkdir -p ' . $HOME . '/.vim/undodir')
endif
set undofile                           " Save undo history
set undodir=~/.vim/undodir             " Directory for undo files

set list
set listchars=tab:▸\ ,trail:·,nbsp:␣  " Define how whitespace is shown


" File navigation
map gf :e <cfile><CR>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" =============================================================================
" APPEARANCE
" =============================================================================
syntax enable
set termguicolors
set background=dark                    " Set dark background

" GitGutter customization
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1


if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also https://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif


" Set custom background color for all screen elements
function! SetBackgroundColor()
    " Normal text background
    highlight Normal guibg=#101010 ctermbg=234
    " Empty line ~ characters
    highlight EndOfBuffer guibg=#101010 ctermbg=234
    " Non-text areas
    highlight NonText guibg=#101010 ctermbg=234
    " Line number column
    highlight LineNr guibg=#101010 ctermbg=234
    " Sign column (gutter)
    highlight SignColumn guibg=#101010 ctermbg=234
    " Vertical split
    highlight VertSplit guibg=#101010 ctermbg=234
endfunction


" highlight SignColumn guibg=#101010 ctermbg=234
" highlight LineNr guibg=#101010 ctermbg=234
" Apply background color after any colorscheme loads
" autocmd ColorScheme * call SetBackgroundColor()
" Ensure background color is applied when Vim starts
" autocmd VimEnter * call SetBackgroundColor()


set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

autocmd ColorScheme * hi User1 guifg=#eea040 guibg=#222222
autocmd ColorScheme * hi User2 guifg=#dd3333 guibg=#222222
autocmd ColorScheme * hi User3 guifg=#ff66ff guibg=#222222
autocmd ColorScheme * hi User4 guifg=#a0ee40 guibg=#222222
autocmd ColorScheme * hi User5 guifg=#eeee40 guibg=#222222

" Make sure these are after colorscheme loading to override defaults
" let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" =============================================================================
" KEY MAPPINGS
" =============================================================================

nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
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
" :nnoremap <Esc><Esc> :noh<CR>
nnoremap <F3> :set hlsearch!<CR>

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
" CURRENT WORD HIGHLIGHTING
" =============================================================================
" Define a custom highlight group for current word
" hi CurrentWord guifg=#D3BF8C guibg=#3A3A3A gui=underline,bold ctermfg=180 ctermbg=237 cterm=underline,bold

" colorscheme koehler
" colorscheme evening

set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
" let g:seoul256_background = 233
" colo distinguished
colo vividchalk


highlight SignColumn guibg=NONE ctermbg=NONE

" highlight clear SignColumn

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
let $FZF_DEFAULT_COMMAND = 'find . -type f ! -path "*/.git/*" ! -path "*/node_modules/*" ! -path "*/build/*" ! -path "*/dist/*" ! -path "*/target/*" ! -path "*/.venv/*"'

nnoremap <space>sf :<C-u>Files<CR>

command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --hidden --glob "!node_modules/*" --glob "!dist/*" --glob "!build/*" --glob "!target/*" --glob "!.venv/*" --glob "!.git/*" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <space>sg :RG<Space>
nnoremap <space>sg :RG<CR>
nnoremap <space>sb :Buffers<CR>


" =============================================================================
" FILETYPE-SPECIFIC SETTINGS
" =============================================================================
filetype plugin indent on

" Razor file detection and configuration
autocmd BufNewFile,BufRead *.razor set filetype=razor
autocmd BufNewFile,BufRead *.cshtml set filetype=razor

" Arduino file detection and configuration
autocmd BufNewFile,BufRead *.ino set filetype=cpp
autocmd BufNewFile,BufRead *.pde set filetype=cpp

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType svelte setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Razor-specific settings
autocmd FileType razor setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType razor setlocal commentstring=@*\%s\*@

filetype plugin on

" Configure CS file settings
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" Arduino/C++ specific settings
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType cpp setlocal commentstring=/*\ %s\ */

" =============================================================================
" VIM-CLOSETAG CONFIGURATION
" =============================================================================
" Enable closetag for specific file types
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.vue,*.svelte,*.razor,*.cshtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.razor,*.cshtml'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript.jsx,typescript.tsx,vue,svelte,razor'
let g:closetag_xhtml_filetypes = 'xhtml,javascript.jsx,typescript.tsx,razor'

" Enable closetag for regions (useful for JSX/TSX)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'razor': 'razorRegion,htmlRegion',
    \ }


" Don't auto-close these HTML tags
let g:closetag_emptyTags_caseSensitive = 1


" For gvim
set guioptions -=m 
set guioptions -=T

" =============================================================================
" YOUCOMPLETEME CONGIGURATION
" =============================================================================
let g:ycm_auto_trigger = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_warning_symbol = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_auto_hover = 1
let g:ycm_semantic_triggers = 0
let g:ycm_signature_help_disable_syntax = 1
let g:ycm_rust_toolchain_root = expand('~/.cargo')

" Arduino/C++ specific configuration
let g:ycm_global_ycm_extra_conf = '~/.ycm_global_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
" Always look for .ycm_extra_conf.py in project directories
let g:ycm_extra_conf_vim_data = ['&filetype']

nnoremap gd :YcmCompleter GoToDefinition<CR>

let s:ycm_hover_popup = -1
function s:Hover()
    let response = youcompleteme#GetCommandResponse( 'GetDoc' )
    if response == ''
      return
    endif

    call popup_hide( s:ycm_hover_popup )
    let s:ycm_hover_popup = popup_atcursor( balloon_split( response ), {} )
endfunction

nnoremap <silent> K :call <SID>Hover()<CR>
nnoremap <Space>f :YcmCompleter Format<CR>
xnoremap <Space>f :YcmCompleter Format<CR>
set completeopt=menu,menuone,noselect

let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_stop_completion = ['<C-m>']

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=10
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

let g:ycm_language_server = [
  \ {
  \   'name': 'php',
  \   'cmdline': [ expand('~/.local/bin/phpactor'), 'language-server' ],
  \   'filetypes': [ 'php' ]
  \ },
\ ]
