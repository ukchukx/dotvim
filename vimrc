execute pathogen#infect()

filetype on
syntax on
set background=light
let g:solarized_termcolors=256
colorscheme solarized

set guifont=Menlo\ Regular:h18
set lines=30 columns=120
set colorcolumn=120

" Enable line numbering
set number
set encoding=utf-8

" Set leader key
let mapleader=" "

" Reload Vim config without having to restart editor
map <leader>s :source ~/.vimrc<CR>

" Keep more info in memory to speed things up
set hidden
set history=100

" Indentation settings
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Highlight found words when running a search
set hlsearch

" Highlight matching parentheses
set showmatch

" ***NerdTree***
" Unfold tree node
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1

" Display tree
nmap <leader>n :NERDTreeToggle<CR>
" Locate focused file in tree
nmap <leader>j :NERDTreeFind<CR>
" Always open tree, but don't focus it
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Ignore unwanted files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" Gitgutter: Always show
let g:gitgutter_sign_column_always=1

" Highlight syntax from the beginning
"autocmd FileType vue syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart
