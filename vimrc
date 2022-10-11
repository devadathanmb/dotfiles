set nocompatible
filetype on
filetype plugin on
filetype indent on

syntax on
set number relativenumber

set ignorecase
set smartcase
set showcmd
set showmatch
set hlsearch

set wildmenu
set wildmode=list:longest

" Use a line cursor within insert mode and block cursor everywhere else
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

