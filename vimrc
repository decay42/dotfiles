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
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer' 
call plug#end()

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    "set termguicolors
  endif
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:NERDTreeIgnore=['node_modules$[[dir]]']
:let @/ = ""

filetype plugin on

scriptencoding utf-8
set encoding=utf-8

:set number relativenumber 
:set list listchars=tab:»·,space:·,trail:~
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set noshowmode
set ai
set si
set so=15

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

syntax on
colorscheme onedark
set background=dark 
set t_Co=256

:let mapleader = " "

map <leader>o :BufExplorer<cr>
map <leader>f :MRU<CR>
let g:ctrlp_map = '<c-f>'
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <esc> :noh<return><esc>

inoremap jk <esc>
