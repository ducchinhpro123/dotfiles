" Vim-plug plugins section
call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'preservim/nerdtree'               " File explorer
Plug 'preservim/nerdcommenter'          " Extended commenting
Plug 'jiangmiao/auto-pairs'             " Auto close brackets

Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'tpope/vim-commentary'             " Easy commenting
Plug 'tpope/vim-sleuth'                 " Extended commenting

" Vim jsx
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

" Vim tsx
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"" Plug 'lervag/vimtex'

Plug 'andymass/vim-matchup'

Plug 'liuchengxu/vim-which-key'

Plug 'airblade/vim-gitgutter'

" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Dart development
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Auto close HTML tag
Plug 'alvan/vim-closetag'

Plug 'sbdchd/neoformat'

Plug 'fenetikm/falcon'
Plug 'bignimbus/pop-punk.vim'

" Initialize plugin system
call plug#end()

runtime! plugins/*.vim

" let g:ycm_language_server = [
"   \   {
"   \     'name': 'dart',
"   \     'cmdline': [ 'dart', 'language-server', '--protocol=lsp' ],
"   \     'filetypes': [ 'dart' ],
"   \   }
"   \ ]


" Neoformat format for languages
let g:neoformat_enabled_python = ['black', 'autopep8']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_html = ['prettier']

nnoremap <silent> <space>cf :Neoformat<CR>
vnoremap <silent> <space>cf :Neoformat<CR>

nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader = ","


nnoremap <silent><nowait> <space>e :<C-u>NERDTreeToggle<cr>
nnoremap <space>sf :<C-u>Files<CR>
nnoremap <space>sg :RG<CR>

" let $FZF_DEFAULT_COMMAND = 'fd --type f'

let $FZF_DEFAULT_COMMAND = 'find . -type f ! -path "*/\.git/*" ! -path "*/node_modules/*" ! -path "*/vendor/*" ! -path "*/build/*" ! -path "*/dist/*" ! -path "*/target/*" '

"
nnoremap <space>sb :Buffers<CR>
let NERDTreeShowHidden=1

" nnoremap <leader>sh :Helptags<CR>

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
set signcolumn=no
set guiheadroom=0
set termguicolors

autocmd FileType java setlocal shiftwidth=4 tabstop=4 expandtab
autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd FileType js setlocal shiftwidth=2 tabstop=2 expandtab

" Theme settings
" set background=dark                    " Set dark background
colorscheme pop-punk                   " Set colorscheme

" highlight CocErrorHighlight ctermfg=Red guifg=#ff0000
highlight CocErrorHighlight ctermbg=Red guibg=#FF0000 ctermfg=White guifg=#ffffff

" highlight cocwarninghighlight ctermfg=Black guifg=#000000 
highlight cocwarninghighlight ctermbg=Yellow guibg=#ffcc00 ctermfg=White guifg=#000000

highlight CocInfoHighlight ctermfg=Blue guifg=#0000ff
highlight CocHintHighlight ctermfg=Blue guifg=#0000ff

" highlight Normal ctermbg=235 guibg=#101010
" highlight LineNr       guifg=#666666 guibg=#110022 ctermfg=242 ctermbg=234
" highlight CursorLineNr guifg=#FFFFFF guibg=#1F1F1F ctermfg=231 ctermbg=234
" highlight SignColumn   guibg=#110022 ctermbg=234

" Enable highlighting color code
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" autocmd BufEnter *.tsx set filetype=typescript

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc> :w!<CR>


execute "set <M-j>=\ej"
execute "set <M-k>=\ek"

" Move line up with Alt+k
nnoremap <M-k> :m .-2<CR>==
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-k> :m '<-2<CR>gv=gv

" Move line down with Alt+j
nnoremap <M-j> :m .+1<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
" nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

