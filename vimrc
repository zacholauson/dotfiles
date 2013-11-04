source ~/.vimrc.bundles

" Leader
let mapleader = " "

set nocompatible

set incsearch     " do incremental searching

set nobackup
set noswapfile

filetype plugin indent on
filetype plugin on

let g:netrw_liststyle=3

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

set backspace=2

set numberwidth=5
set foldcolumn=0

" Display extra whitespace
set list listchars=tab:»·,trail:·

set history=1000
set undolevels=1000

" Color scheme
syntax enable
set t_Co=256
set background=dark
colorscheme twilight_lucas

set numberwidth=5
set foldcolumn=0

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" html2haml
:vmap <leader>h :!/Users/zacholauson/.rvm/bin/vim_html2haml<cr>
