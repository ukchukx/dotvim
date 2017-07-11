execute pathogen#infect()

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