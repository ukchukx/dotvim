set nocompatible

execute pathogen#infect()


filetype on
syntax on
set pastetoggle=<F2> " disable Vim indents on paste
set nobackup
set noswapfile
set title
set hidden
set background=light
colorscheme material
set visualbell " don't beep
" set noerrorbells don't beep

"set guifont=Menlo\ Regular:h18
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11
" set lines=30 columns=120
set colorcolumn=120

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
else
  if $TERM == 'xterm'
    set term=xterm-256color
  endif
endif


set number " Enable line numbering

" Set encoding
set encoding=utf-8
set fileencoding=utf-8

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
filetype plugin indent on
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
let g:gitgutter_terminal_reports_focus=0

" Highlight syntax from the beginning
"autocmd FileType vue syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
nnoremap <silent> <leader>e :FZF -m<CR>


" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']

let python_highlight_all = 1

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>N"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_auto_jump = 0

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif


" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
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



