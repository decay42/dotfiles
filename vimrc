call plug#begin('~/.local/share/nvim/plugged')
" ******************************* Color/Themes *******************************
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'chrisbra/Colorizer'

" ******************************** Exploring *********************************
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/bufexplorer.zip'

" ********************************* Comfort **********************************
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'ervandew/supertab'
Plug 'yggdroot/indentline'
Plug 'machakann/vim-highlightedyank'

" ********************************* Movement *********************************
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" ****************************** Misc/External *******************************
Plug 'mkitt/tabline.vim'
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux'

" **************************** Syntax/Completion *****************************
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'

" ******************************* deactivated ********************************
"Plug 'jelera/vim-javascript-syntax'
"Plug 'sheerun/vim-polyglot'
"Plug 'scrooloose/nerdtree'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
"Plug 'lervag/vimtex'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'nightsense/cosmic_latte'
"Plug 'chriskempson/base16-vim'
"Plug 'morhetz/gruvbox'
"Plug 'sonph/onehalf', {'rtp': 'vim/'}
call plug#end()

" **************************************************************************** 
" ************************* PLUGIN SPECIFIC SETTINGS *************************
" **************************************************************************** 
let g:deoplete#enable_at_startup = 1

filetype plugin on

"" Disable polyglot for latex because of lacking compatibilty
"let g:polyglot_disabled = ['latex']
"" Disable vue preprocessor checks for performance
"let g:vue_disable_pre_processors=1

"" Ignore stuff
"let g:NERDTreeIgnore=['node_modules$[[dir]]']
set wildignore+=*/node_modules/* 

"" **************************** Lightline Settings ****************************
"let g:lightline = {
  "\ 'colorscheme': 'one',
  "\ }

"" ***************************** Airline Settings *****************************
"let g:airline_theme='onedark'
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 1

"" ***************************** Vimtex Settings ******************************
"let g:vimtex_compiler_progname = 'nvr'
"let g:vimtex_view_method = 'mupdf'
"let g:vimtex_quickfix_latexlog = {
  "\ 'overfull' : 0,
  "\ 'underfull' : 0,
  "\ 'packages' : {
  "\   'default' : 0,
  "\ },
  "\}
"let g:tex_flavor = "latex"
"let g:tex_conceal = ""

" ****************************** Sneak Settings ******************************
let g:sneak#s_next = 1

" *************************** Indent Line Settings ***************************
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#30363C'
let g:indentLine_setConceal = 0

" *************************** EasyMotion Settings ****************************
let g:EasyMotion_smartcase = 1

" ****************************** Netrw Settings ******************************
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" **************************** Autopairs Settings ****************************
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" ************************** YouCompleteMeSettings ***************************
let g:ycm_autoclose_preview_window_after_insertion = 1
set previewheight=50

" ****************************************************************************
" *************************** COLOR/THEME SETTINGS ***************************
" ****************************************************************************

syntax on            " syntax highlighting
set background=dark
colorscheme one

" ************************ Enable true color support *************************
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" ************************** Colorscheme Overrides ***************************
hi TabLine                     guibg=#5c6370   cterm=NONE gui=NONE 
hi Search      guifg=DarkRed   guibg=#e5c07b 
hi IncSearch   guifg=DarkRed   guibg=#e5c07b 

" ****************************************************************************
" ***************************** GENERAL SETTINGS ***************************** 
" ****************************************************************************

" Clear search highlights on startup
let @/ = ''

scriptencoding utf-8
set encoding=utf-8

set omnifunc=syntaxcomplete#Complete " enable syntax completion

set number relativenumber    " hybrid line numbers
"set list listchars=tab:»·,
"  \space:·,trail:~           " 'invisible' characters
set nolist
set expandtab                " convert tabs to spaces
set smarttab                 " use smart tabs
set hlsearch                 " highlight search results in entire file
set shiftwidth=2             " use 2 spaces for indentation
set softtabstop=2            " same
set tabstop=2
set noshowmode               " hide vim statusbar
set ai                       " autoindent
set si                       " smartindent
set so=15                    " leave 15 lines around cursor on top/bottom
set conceallevel=0           " never conceal anything

" from ultimate .vimrc
set history=500              " remember 500 undo steps
set ignorecase               " search case insensitive
set smartcase                " enable smartcase in search
set incsearch                " use incremental searching (search as you type)
set lazyredraw
set magic
set showmatch
set foldcolumn=1             " add 1 blank column next to line numbers
set inccommand=nosplit

autocmd Filetype gitcommit setlocal textwidth=72

" **************************************************************************** 
" ********************************* BINDINGS *********************************
" **************************************************************************** 

" ************************ Misc/general vim mappings *************************
let mapleader = ' '
let maplocalleader = ' '
let g:ctrlp_map = '<c-f>'

nnoremap <esc> :noh<return><esc>
inoremap jk <esc>

map <leader>o :BufExplorer<cr>
map <leader>f :CtrlPMRU<CR>
"map <leader>nn :NERDTreeToggle<cr>
"map <leader>nb :NERDTreeFromBookmark 
"map <leader>nf :NERDTreeFind<cr>
map <leader>nn :Lexplore<cr>
map <leader>lv :VimtexView<cr>
map <leader>ch <Plug>Colorizer

"map  <C-B>      YpkI\begin{<DEL><ESC>A}<ESC>jI\end{<DEL><ESC>A}<esc>kA
"map! <C-B> <ESC>YpkI\begin{<DEL><ESC>A}<ESC>jI\end{<DEL><ESC>A}<esc>kA

" *********************** Move lines with alt+j/alt+k ************************
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" ************************** Tab for autocompletion **************************
inoremap <tab> <c-x><c-o>

" *************************** Easymotion mappings ****************************
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>e <Plug>(easymotion-e)
nmap <leader>s <Plug>(easymotion-overwin-f2)

" ************************ Remapping for easier marks ************************
nnoremap ' `
nnoremap ` '
onoremap ' `
onoremap ` ' 

map <Leader>m 'm

" **** automatically jump to the end of the text you just copied/pasted: *****
xnoremap <silent> y y`]
nnoremap <silent> yy yy`]
xnoremap <silent> p p`]
xnoremap <silent> P P`]
nnoremap <silent> p p`]
nnoremap <silent> P P`]

" *************************** reselect pasted text ***************************
nnoremap <Leader>gv `[v`]

" ********************* Backspace switch previous window *********************
nnoremap <BS> <C-^>

" ************************** Auto header formatting **************************
nnoremap <Leader>h1 :center 76<cr>hhv0r*A<space><esc>40a*<esc>d76<bar>YppVr*kk.0
nnoremap <Leader>h2 :center 76<cr>hhv0r*A<space><esc>40a*<esc>d76<bar>0

" ************************** persistent very magic ***************************
nnoremap / /\v

" ****************************** Vimux mappings *******************************
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" *********************** sudo write a write file w!! ************************
cmap w!! w !sudo tee > /dev/null %
