" =============================================================================
" PLUGIN MANAGEMENT
" =============================================================================
call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-expand-region'

Plug 'IngoMeyer441/coc_current_word',

" File navigation and UI
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'alvan/vim-closetag'

" Code editing helpers
" Plug 'preservim/nerdcommenter'          " Extended commenting
Plug 'jiangmiao/auto-pairs'             " Auto close brackets
Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Plug 'andymass/vim-matchup'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', { 'branch': 'release'}

Plug 'sheerun/vim-polyglot'

Plug 'lumiliet/vim-twig'


call plug#end()

" =============================================================================
" GENERAL SETTINGS
" =============================================================================
set nobackup
set nowritebackup
set noswapfile
set autoread                          " Auto-reload files when changed externally
set mouse=a
set clipboard=unnamedplus             " Use system clipboard
set updatetime=300
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
" " Apply background color after any colorscheme loads
" autocmd ColorScheme * call SetBackgroundColor()
" Ensure background color is applied when Vim starts
" autocmd VimEnter * call SetBackgroundColor()

" Status line configuration
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Make sure these are after colorscheme loading to override defaults
" let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx"

" =============================================================================
" KEY MAPPINGS
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
let g:coc_current_word_highlight_delay = 0
" hi CurrentWord guifg=#D3BF8C guibg=#3A3A3A gui=underline,bold ctermfg=180 ctermbg=237 cterm=underline,bold


colorscheme evening
set t_Co=256                         " Enable 256 colors
set termguicolors                    " Enable GUI colors for the terminal to get truecolor

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
let $FZF_DEFAULT_COMMAND = 'find . -type f ! -path "*/\.git/*" ! -path "*/node_modules/*" ! -path "*/build/*" ! -path "*/dist/*" ! -path "*/target/*" '

nnoremap <space>sf :<C-u>Files<CR>
nnoremap <space>sg :RG<CR>
nnoremap <space>sb :Buffers<CR>

" =============================================================================
" WHICH-KEY CONFIGURATION
" =============================================================================
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" =============================================================================
" COC CONFIGURATION
" =============================================================================

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <leader>d for show list of diagnostics of current buffer.
" nmap <leader>d  <Plug>(coc-diagnostic-info)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other status line plugins
" https://github.com/neoclide/coc.nvim/wiki/Status-line-integration
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList commands
" Show all diagnostics
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>x  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

let g:vim_svelte_plugin_use_typescript = 1



" =============================================================================
" FILETYPE-SPECIFIC SETTINGS
" =============================================================================
filetype plugin indent on

" Razor file detection and configuration
autocmd BufNewFile,BufRead *.razor set filetype=razor
autocmd BufNewFile,BufRead *.cshtml set filetype=razor

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Razor-specific settings
autocmd FileType razor setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType razor setlocal commentstring=@*\ %s\ *@

filetype plugin on

" Configure CS file settings
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

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

