filetype on
syntax on
set background=light
colorscheme solarized

set guifont=Menlo\ Regular:h18
set lines=35 columns=150
set colorcolumn=120
set number

let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

set hidden
set history=100

filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
