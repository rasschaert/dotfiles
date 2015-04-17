set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" The NERD tree
Plugin 'scrooloose/nerdtree'
" One stop shop for vim colorschemes
Plugin 'flazz/vim-colorschemes'
" Airline
Plugin 'bling/vim-airline'
"Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'pangloss/vim-javascript'
"Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plugin 'bronson/vim-trailing-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Generated on http://vimconfig.com/
set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set ruler
set undolevels=1000
set backspace=indent,eol,start


" keybindings
noremap ; l
noremap l k
noremap k j
noremap j h

" colors
syntax on
set background=dark

" stop autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable airline
set laststatus=2

"let g:airline_theme= "murmur"
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
  let g:airline_symbols.space = "\ua0"

" 256-color support
set t_Co=256

" Highlight current line
set cursorline

" promptline config
let g:promptline_theme = 'airline'
" sections (a, b, c, x, y, z, warn) are optional
"   \'a' : [ promptline#slices#host() ],
let g:promptline_preset = {
  \'a' : [ promptline#slices#user() ],
  \'b' : [ '$(hostname)' ],
  \'c' : [ promptline#slices#cwd() ],
  \'y' : [ promptline#slices#git_status() ],
  \'z' : [ promptline#slices#vcs_branch({ 'git': 1, 'svn': 1}) ],
  \'warn' : [ promptline#slices#last_exit_code() ]}

