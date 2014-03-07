source ~/.vimrc.bundles
let mapleader = " "
set nocompatible

set t_Co=256
set t_ut=

syntax enable
set bg=dark
colorscheme base16-eighties

let vimclojure#HighlightBuiltins=1

set nocursorcolumn
set nocursorline
syntax sync minlines=256

set number
set numberwidth=2

set incsearch     " do incremental searching
set hlsearch      " highlight all matches after entering search pattern
set nobackup
set noswapfile

filetype plugin indent on
filetype plugin on

let g:netrw_liststyle=3

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2
set numberwidth=5
set foldcolumn=0
set list listchars=tab:»·,trail:·
set showtabline=1

set history=1000
set undolevels=500

set numberwidth=5
set foldcolumn=0

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Hold shift to move quicker for scanning really large files
nmap <s-j> 3j
nmap <s-k> 3k
nmap <s-h> 3h
nmap <s-l> 3l

inoremap jk <esc>

set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" set hiccup files to clojure syntax
au BufRead,BufNewFile *.hiccup setfiletype clojure
