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

" Fix the delay while switching to normal mode
set noesckeys

"leader key
let mapleader = " "

" Change cursor hack

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Nerdtree keymappings

nmap <leader>e :NERDTreeToggle<CR>
