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
call plug#end()

" **************************************************************************** 
" ######################### PLUGIN SPECIFIC SETTINGS #########################
" **************************************************************************** 

filetype plugin on

" Disable polyglot for latex because of lacking compatibilty
let g:polyglot_disabled = ['latex']

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:NERDTreeIgnore=['node_modules$[[dir]]']

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
let g:vimtex_view_method = "mupdf"
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

syntax on
colorscheme onedark

" ****************************************************************************
" ############################# GENERAL SETTINGS ############################# 
" ****************************************************************************

" Enable true color support
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Clear search highlights on startup
let @/ = ""

scriptencoding utf-8
set encoding=utf-8

set number relativenumber 
set list listchars=tab:»·,space:·,trail:~
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set noshowmode
set ai     " autoindent
set si     " smartindent
set so=15  " leave 15 lines around cursor on top/bottom
set omnifunc=syntaxcomplete#Complete " enable syntax completion

" from ultimate .vimrc
set history=500
set ignorecase
set smartcase
set hlsearch
set incsearch 
set lazyredraw 
set magic
set showmatch 
set foldcolumn=1

" **************************************************************************** 
" ################################# BINDINGS #################################
" **************************************************************************** 

let mapleader = " "
let maplocalleader = " "

map <leader>o :BufExplorer<cr>
map <leader>f :MRU<CR>
let g:ctrlp_map = '<c-f>'
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

map <leader>lv :VimtexView<cr>

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <esc> :noh<return><esc>

inoremap jk <esc>
