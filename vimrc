set nocompatible

filetype on
syntax on
set pastetoggle=<F2> " disable Vim indents on paste
set nobackup
set noswapfile
set title
set hidden
set modeline
set number " Enable line numbering
" Set encoding
set encoding=utf-8
set fileencoding=utf-8
" Change default octal behaviour for C-a, C-x etc
set nrformats=
" Set leader key
let mapleader=" "
set visualbell " don't beep
" set noerrorbells don't beep
set colorcolumn=120

" Reload Vim config without having to restart editor
map <Leader>s :source ~/.vimrc<CR>

" Keep more info in memory to speed things up
set hidden
set history=100
set undolevels=100

" Indentation settings
filetype plugin indent on
set nowrap
set tabstop=2
set shiftwidth=2
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set smartindent
set autoindent
set exrc " .vimrc in local project dir"
set secure
autocmd BufRead,BufNewFile * set signcolumn=yes
autocmd FileType tagbar,nerdtree set signcolumn=no
set foldmethod=indent
set nofoldenable
set diffopt+=vertical
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
:augroup END

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

set hlsearch " Highlight found words when running a search
set incsearch " Show search matches as you type
set showmatch " Highlight matching parentheses

execute pathogen#infect()

" *****Theming*****

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors') && $TERM_PROGRAM ==# 'iTerm.app')
  set termguicolors
endif

set background=dark
set cursorline

let g:material_theme_style = 'palenight'
let g:airline_theme = 'material'
let g:material_terminal_italics = 1
colorscheme material

"-- Whitespace highlight --
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" ***NerdTree***
" Unfold tree node
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeNodeDelimiter = "\u00a0"

" Close Vim if the only window left is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


set guifont=Anonymice\ Nerd\ Font\ 12
" set lines=30 columns=120

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
else
  if $TERM == 'xterm'
    set term=xterm-256color
  endif
endif


" Display tree
nmap <Leader>n :NERDTreeToggle<CR>
" Locate focused file in tree
nmap <Leader>j :NERDTreeFind<CR>
" Always open tree, but don't focus it
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Ignore unwanted files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.swo', '\.pyc$']

" Gitgutter: Always show
set signcolumn=yes
let g:gitgutter_terminal_reports_focus=0
let g:gitgutter_set_sign_backgrounds = 0

" Highlight syntax from the beginning
autocmd BufEnter * :syntax sync fromstart


" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']

let python_highlight_all = 1

" *****IndentLine*****
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif


" *****Airline******
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


" ******Devicons*****
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


"-- Exuberant Ctags --
set tags=tags
