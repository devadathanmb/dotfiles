" Disable vi stuff
set nocompatible

" Filetype indent stuff
filetype on
filetype plugin on
filetype indent on

" Use system clipboard
set clipboard=unnamedplus

" Syntax
syntax on

" Line numbering
set number relativenumber

" Smart searching
set ignorecase
set smartcase
set showcmd
set showmatch
set hlsearch

set wildmenu
set wildmode=list:longest

" Tab settings
set tabstop=4 "tabs expand to 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab

" Split properly
set splitbelow splitright

"Stop auto commenting
set formatoptions-=cro

"search as characters are entered
set incsearch

"leader key
let mapleader = " "

" Do not yank for d or c
nnoremap d "_d
nnoremap D "_D

nnoremap "*d "*d
nnoremap "*D "*D

nnoremap c "_c
nnoremap C "_C

nnoremap "*c "*c
nnoremap "*C "*C

" Change cursor hack

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


"install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins go here 
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'

Plug 'scrooloose/nerdtree'

Plug 'https://github.com/machakann/vim-highlightedyank'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Colorscheme
colorscheme gruvbox
set background=dark
let g:airline_theme='behelit'

" Nerdtree keymappings

nmap <leader>e :NERDTreeToggle<CR>
