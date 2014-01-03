source ~/.vimrc.bundles

let mapleader = " "

set nocompatible
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
set number

set history=1000

set undolevels=500

syntax enable
set t_Co=256
set background=dark

set numberwidth=5
set foldcolumn=0

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Hold shift to move quicker for scanning really large files
nmap <s-j> 3j
nmap <s-k> 3k
nmap <s-h> 3h
nmap <s-l> 3l

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --line-numbers\ --noheading

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" spell check
autocmd BufRead,BufNewFile *.md setlocal spell
