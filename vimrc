call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/mru.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
call plug#end()

" **************************************************************************** 
" ######################### PLUGIN SPECIFIC SETTINGS #########################
" **************************************************************************** 

filetype plugin on

" Disable polyglot for latex because of lacking compatibilty
let g:polyglot_disabled = ['latex']
" Disable vue preprocessor checks for performance
let g:vue_disable_pre_processors=1

" Ignore stuff
let g:NERDTreeIgnore=['node_modules$[[dir]]']
set wildignore+=*/node_modules/* 

" ############################# Airline Settings ############################# 
let g:airline_theme='onedark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" ############################## Vimtex Settings ############################## 
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'mupdf'
let g:vimtex_quickfix_latexlog = {
  \ 'overfull' : 0,
  \ 'underfull' : 0,
  \ 'packages' : {
  \   'default' : 0,
  \ },
  \}
let g:tex_flavor = "latex"

" ****************************************************************************
" ########################### COLOR/THEME SETTINGS ###########################
" ****************************************************************************

syntax on            " syntax highlighting
colorscheme onedark  " onedark color scheme, like atom one dark

" Enable true color support
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" ****************************************************************************
" ############################# GENERAL SETTINGS ############################# 
" ****************************************************************************

" Clear search highlights on startup
let @/ = ''

scriptencoding utf-8
set encoding=utf-8

set omnifunc=syntaxcomplete#Complete " enable syntax completion

set number relativenumber    " hybrid line numbers
set list listchars=tab:»·,
  \space:·,trail:~           " 'invisible' characters
set expandtab                " convert tabs to spaces
set smarttab                 " use smart tabs
set shiftwidth=2             " use 2 spaces for indentation
set softtabstop=2            " same
set noshowmode               " hide vim statusbar
set ai                       " autoindent
set si                       " smartindent
set so=15                    " leave 15 lines around cursor on top/bottom

" from ultimate .vimrc
set history=500              " remember 500 undo steps
set ignorecase               " search case insensitive
set smartcase                " enable smartcase in search
set hlsearch                 " highlight search results in entire file
set incsearch                " use incremental searching (search as you type)
set lazyredraw
set magic
set showmatch
set foldcolumn=1             " add 1 blank column next to line numbers

" **************************************************************************** 
" ################################# BINDINGS #################################
" **************************************************************************** 

let mapleader = ' '
let maplocalleader = ' '

let g:ctrlp_map = '<c-f>'
map <leader>o :BufExplorer<cr>
map <leader>f :MRU<CR>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>
map <leader>lv :VimtexView<cr>
map <leader>ch <Plug>Colorizer

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
nnoremap <esc> :noh<return><esc>

vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

inoremap jk <esc>
noremap <tab> <c-x><c-o>
