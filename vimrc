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

Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'rking/ag.vim'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'zhaocai/GoldenView.Vim'

Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/tComment'

Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'

" --- Language Specific --- "

" Ruby
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" Clojure
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'

" JSON
Plugin 'elzr/vim-json'

" TOML
Plugin 'cespare/vim-toml'

" Terraform
Plugin 'hashivim/vim-terraform'

" Nginx
Plugin 'chr4/nginx.vim'

" Elixir
Plugin 'elixir-editors/vim-elixir'

" Typescript
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on

" --------------------------------- "
" ------------- Theme ------------- "
" --------------------------------- "

syntax enable

set t_Co=256 t_ut=
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let base16colorspace=256
colorscheme base16-ocean
set background=dark

set nocursorcolumn cursorline
set synmaxcol=300
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
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob "!.git/*"'

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

" --------------------------------- "
" -------------- MISC ------------- "
" --------------------------------- "

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

let g:html_indent_tags = 'li\|p'
let g:vim_markdown_folding_disabled = 1

nnoremap <silent><C-h><C-l> :nohl<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

vnoremap <leader>su :sort ui<CR>

map <leader>pp :setlocal paste!<cr>

nnoremap <leader>c "*yy
vnoremap <leader>c "*y
nnoremap <leader>v "*p
vnoremap <leader>v "*p

nnoremap <leader>jj :%s !python -m json.tool<cr>gg=G
vnoremap <leader>jj :!python -m json.tool<cr>gg=G

nnoremap <leader>chs :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>
vnoremap <leader>chs :s/:\([^ ]*\)\(\s*\)=>/\1:/gc<cr>

vnoremap <leader>cq :s/"/'/gc<cr>

" XML Formatting
nnoremap <leader>xf :%s/></>\r</g<CR>gg=G

" --------------------------------- "
" ---- Additional File Support ---- "
" --------------------------------- "
au FileType json                                         setf javascript
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au BufRead,BufNewFile *.{hiccup,cljs,edn,cljx}           setf clojure
au BufRead,BufNewFile Vagrantfile                        setf ruby
au BufRead,BufNewFile *.gradle                           setf groovy
au BufRead,BufNewFile *.{tf,tfvars}                      setf terraform
au BufRead,BufNewFile *.tfstate                          setf javascript

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
