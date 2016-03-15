let mapleader = " "
let g:netrw_liststyle=3

set nocompatible
set noerrorbells
set history=1000
set undolevels=500
set nobackup noswapfile

set tabstop=2 shiftwidth=2 backspace=2 expandtab

set colorcolumn=100
set backspace=indent,eol,start
set splitright splitbelow
set autoindent nowrap
set incsearch nohlsearch
set cino+=(0)
set ttyfast
set lazyredraw

let ruby_operators = 1

" --------------------------------- "
" ------------ Bundles ------------ "
" --------------------------------- "

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'takac/vim-spotifysearch'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/tComment'
Plugin 'Yggdroot/indentLine'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'tpope/vim-dispatch'
Plugin 'benmills/vimux'
Plugin 'skalnik/vim-vroom'

" --- Language Specific --- "

" Ruby
Plugin 'tpope/vim-endwise'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

" JSON
Plugin 'elzr/vim-json'

" Arduino
Plugin 'sudar/vim-arduino-syntax'

" Clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

" CSS3
Plugin 'hail2u/vim-css3-syntax'
Plugin 'JulesWang/css.vim'

call vundle#end()
filetype plugin indent on

" --------------------------------- "
" ------------- Theme ------------- "
" --------------------------------- "

syntax enable

set t_Co=256 t_ut=
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" colorscheme lucius
let base16colorspace=256
colorscheme base16-ocean
set background=dark

set nocursorcolumn nocursorline
set synmaxcol=800
set list listchars=tab:»·,trail:·
set showtabline=1
set fillchars=vert:˙
set number numberwidth=2
set foldcolumn=0
set encoding=utf-8
set laststatus=2

" --------------------------------- "
" ------------ Movement ----------- "
" --------------------------------- "

" Switch between the last two files
nnoremap <leader><leader> <c-^>
imap <C-l> <Right>

" --------------------------------- "
" ------------ Plugins ------------ "
" --------------------------------- "

"             Nerd Tree             "
map <C-n> :NERDTreeToggle<CR>
map <C-n><C-f> :NERDTreeFind<CR>

"               Gist                "
let g:gist_clip_command    = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates   = 1
let g:gist_post_private    = 1

vnoremap <C-g><C-g> :Gist<CR>
nnoremap <C-g><C-g> :Gist<CR>

"           GoldenView              "
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-L> <Plug>GoldenViewSplit

"         Clojure Static            "
let g:clojure_align_multiline_strings = 1

"           vimclojure              "
let vimclojure#DynamicHighlighting = 1
let vimclojure#HighlightBuiltins = 1
let vimclojure#HighlightContrib = 1
let vimclojure#FuzzyIndent = 1

"           Tabularize              "
vmap <Leader>a=  :Tabularize /=<CR>
vmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a,  :Tabularize /,\zs<CR>
vmap <Leader>a:  :Tabularize /:\zs<CR>

"              CtrlP                "
let g:ctrlp_user_command = 'ag %s -f -l --nocolor -g ""'

"           IndentLine              "
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

"             Airline               "
let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"             JSON                  "
let g:vim_json_syntax_conceal = 0

let g:vroom_use_vimux = 1
let g:vroom_ignore_color_flag = 1

" --------------------------------- "
" -------------- MISC ------------- "
" --------------------------------- "

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

let g:html_indent_tags = 'li\|p'
let g:vim_markdown_folding_disabled = 1

nnoremap <silent><C-h><C-l> :nohl<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

vnoremap <leader>su :sort ui<CR>

" Enable paste mode
map <leader>pp :setlocal paste!<cr>

" Copy / paste to mac clipboard
nnoremap <leader>c "*yy
vnoremap <leader>c "*y
nnoremap <leader>v "*p
vnoremap <leader>v "*p

" Format JSON
nnoremap <leader>jj :%s !python -m json.tool<cr>gg=G
vnoremap <leader>jj :!python -m json.tool<cr>gg=G

" Convert Ruby hash syntax
nnoremap <leader>chs :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>
vnoremap <leader>chs :s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>

" Convert Double Quotes to Single Quotes
vnoremap <leader>cq :s/"/'/gc<cr>

" --------------------------------- "
" ---- Additional File Support ---- "
" --------------------------------- "
au FileType json setf javascript
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au BufRead,BufNewFile *.{hiccup,cljs,edn,cljx}           setf clojure
au BufRead,BufNewFile Vagrantfile                        setf ruby
au BufRead,BufNewFile *.gradle                           setf groovy

let g:ruby_path="/usr/local/var/rbenv/shims/ruby"

" --------------------------------- "
" ----------- Functions ----------- "
" --------------------------------- "

function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

function! PromoteToLet()
    :normal! dd
    :exec '?^\s*it\>'
    :normal! P
    :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2  }/
    :normal ==
endfunction

:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>
