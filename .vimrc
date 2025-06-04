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

Plug 'alvan/vim-closetag'

Plug 'OmniSharp/omnisharp-vim'
Plug 'jlcrochet/vim-razor'

" Code editing helpers
Plug 'preservim/nerdcommenter'          " Extended commenting
Plug 'jiangmiao/auto-pairs'             " Auto close brackets
Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Plug 'andymass/vim-matchup'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Code completion and intelligence
" " Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --ts-completer --java-completer --python-completer' }
" Language support
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Plug 'othree/html5.vim'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'peitalin/vim-jsx-typescript'

" LaTeX support
Plug 'lervag/vimtex'

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

call plug#end()

" =============================================================================
" GENERAL SETTINGS
" =============================================================================
set nobackup
set nowritebackup
set nowb
set noswapfile
set autoread                          " Auto-reload files when changed externally
set mouse=a
set clipboard=unnamedplus             " Use system clipboard
set updatetime=300
set encoding=utf-8
set ruler                             " Show cursor position
set laststatus=2                      " Always show status line
set guiheadroom=0

" Check for file changes more frequently
" Trigger `autoread` when files change on disk and when switching buffers
" augroup AutoReloadFile
"     autocmd!
"     " Check if file has changed when cursor stops moving
"     autocmd CursorHold,CursorHoldI * checktime
"     " Check when switching buffers or focusing Vim again
"     autocmd FocusGained,BufEnter * checktime
" augroup END

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
" " " Ensure background color is applied when Vim starts
" autocmd VimEnter * call SetBackgroundColor()

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
" CURRENT WORD HIGHLIGHTING
" =============================================================================
" Define a custom highlight group for current word
highlight CurrentWord ctermbg=238 guibg=#444444 ctermfg=NONE guifg=NONE gui=NONE cterm=NONE

" Alternative: Highlight on CursorHold (less frequent)
" autocmd CursorMoved * silent! exe printf('match CurrentWord /\<%s\>/', escape(expand('<cword>'), '/\'))
" autocmd InsertEnter,BufLeave * match none

" autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

colorscheme candycode
highlight clear SignColumn

" " colorscheme blackbeauty

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

highlight CocWarningHighlight guifg=#e5c07b gui=italic
highlight CocWarningHighlight guibg=#2c323c gui=italic
highlight CocHintHighlight guifg=#56b6c2 guibg=#2c323c gui=italic


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
" LATEX CONFIGURATION
" =============================================================================
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'xelatex'

" Additional LaTeX configuration
let g:vimtex_quickfix_mode = 0         " Show quickfix window on errors
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" Enable folding for LaTeX documents
let g:vimtex_fold_enabled = 0
" let g:vimtex_fold_types = {
"     \ 'comments' : {'enabled' : 1},
"     \ 'preamble' : {'enabled' : 1},
"     \ 'sections' : {'enabled' : 1},
"     \}

" Enable indentation for LaTeX
let g:vimtex_indent_enabled = 0

" Enable text objects for LaTeX
let g:vimtex_text_obj_enabled = 1
let g:vimtex_text_obj_variant = 'vimtex'

" Enable completion for LaTeX with YouCompleteMe
" if !exists('g:ycm_semantic_triggers')
"     let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" LaTeX specific mappings
augroup latex_mappings
    autocmd!
    autocmd FileType tex nnoremap <buffer> <localleader>ll :VimtexCompile<CR>
    autocmd FileType tex nnoremap <buffer> <localleader>lv :VimtexView<CR>
    autocmd FileType tex nnoremap <buffer> <localleader>lc :VimtexClean<CR>
    autocmd FileType tex nnoremap <buffer> <localleader>le :VimtexErrors<CR>
    autocmd FileType tex nnoremap <buffer> <localleader>lt :VimtexTocToggle<CR>
    autocmd FileType tex nnoremap <buffer> <localleader>li :VimtexInfo<CR>
    autocmd FileType tex inoremap <buffer> [[ \begin{
    autocmd FileType tex inoremap <buffer> ]] \end{
augroup END

" Set spell checking for LaTeX documents
" autocmd FileType tex setlocal spell spelllang=en_us

" =============================================================================
" FILETYPE-SPECIFIC SETTINGS
" =============================================================================
filetype plugin indent on

" Razor file detection and configuration
autocmd BufNewFile,BufRead *.razor set filetype=razor
autocmd BufNewFile,BufRead *.cshtml set filetype=razor

autocmd FileType dart setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Razor-specific settings
autocmd FileType razor setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType razor setlocal commentstring=@*\ %s\ *@

" =============================================================================
" OMNISHARP CONFIGURATION
" =============================================================================
" Use the installed OmniSharp-roslyn server
let g:OmniSharp_server_use_net6 = 1

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible)
set completeopt=longest,menuone,preview

" OmniSharp won't work without this setting
filetype plugin on

" Fetch full documentation during omnicomplete requests
let g:omnicomplete_fetch_full_documentation = 1

" Set the type lookup function to use the preview window instead of echoing it
let g:OmniSharp_typeLookupInPreview = 0

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't show type information in the echo area
let g:OmniSharp_echo_type = 0

let g:OmniSharp_highlighting = 0
" Highlight semantic suggestions
" let g:OmniSharp_highlighting = 3

" OmniSharp key mappings
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Find all code errors/warnings for the current solution
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

    " Contextual code actions (uses fzf, vim-clap or ctrlp.vim selector when available)
    autocmd FileType cs nnoremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <buffer> <Leader>nm :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<CR>
    " Rename without dialog - with cursor on the symbol to rename
    autocmd FileType cs nnoremap <buffer> <Leader>r :OmniSharpRename<CR>

    " Format document
    autocmd FileType cs nnoremap <buffer> <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>
augroup END

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

