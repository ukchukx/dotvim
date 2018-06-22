set nocompatible

execute pathogen#infect()


filetype on
syntax on
set pastetoggle=<F2> " disable Vim indents on paste
set nobackup
set noswapfile
set hidden
set background=light
let g:solarized_termcolors=256
colorscheme solarized

"set guifont=Menlo\ Regular:h18
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11
set lines=30 columns=120
set colorcolumn=120

" Enable line numbering
set number
set encoding=utf-8

" Change default octal behaviour for C-a, C-x etc
set nrformats=

" Set leader key
let mapleader=" "

" Reload Vim config without having to restart editor
map <leader>s :source ~/.vimrc<CR>

" Keep more info in memory to speed things up
set hidden
set history=100
set undolevels=100

" Indentation settings
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set smartindent
set autoindent

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e


set hlsearch " Highlight found words when running a search
set incsearch " Show search matches as you type


set showmatch " Highlight matching parentheses

" ***NerdTree***
" Unfold tree node
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1

" Close Vim if the only window left is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Delete buffer of deleted file
let NERDTreeAutoDeleteBuffer=1

" Display tree
nmap <leader>n :NERDTreeToggle<CR>
" Locate focused file in tree
nmap <leader>j :NERDTreeFind<CR>
" Always open tree, but don't focus it
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Ignore unwanted files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.swo', '\.pyc$']

" Gitgutter: Always show
set signcolumn=yes

" Highlight syntax from the beginning
"autocmd FileType vue syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart

" ***Airline***
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


let python_highlight_all=1


