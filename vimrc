set number

" Directs all yanked content to OS clipboard
set clipboard=unnamed


" Enable type file detection. Vim will be able to try & detect filetype."
filetype on

" Load an indent file for the detected file type."
filetype indent on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Changes default color scheme
"colorscheme slate 


" Calling the plugin manager."
call plug#begin()

" Installs a fuzzy finder. Used for navigating project directories.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Installs coc, an intellisense for vim.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File system navigator
Plug 'scrooloose/nerdtree', {'branch': 'master'}

" Different themes (papercolor)
Plug 'NLKNguyen/papercolor-theme'

" Syntax highlighting for fzf preview
Plug 'sharkdp/bat'

" Go to definition plugin
Plug 'pechorin/any-jump.vim'


" Ending section where plugins go
call plug#end() 


" Enables all python syntax highlighting for plugin python-syntax
let g:python_highlight_all = 1

" Changing theme
set background=dark
colorscheme PaperColor

"fzf --preview 'bat --color=always {}' --preview-window '~3' THIS IS NOT
"WORKING, FIND A WAY TO MAKE IT WORK

" ================ CHANGING DEFAULT BEHAVIORS =============

" Normal mode: Jump to definition under cursor
nnoremap gd :AnyJump<CR>

" NERDTree key bindings!
nnoremap <S-r> :NERDTreeFocus<CR>
" Toggle NerdTree on and off
nnoremap <S-e> :NERDTreeToggle<CR> 
" Traverse nerd tree
nnoremap <S-f> :NERDTreeFind<CR>

"Do ctrl - w - p to move between NerdTree and the standard window

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" FuzzyFinder FZF key bindings!

nnoremap <C-f> :Files<CR>

" use <tab> to trigger completion and navigate to the next complete item for
" CocConfig (i.e. intellisense)
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
