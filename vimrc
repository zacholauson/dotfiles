let mapleader = " "
let g:netrw_liststyle=3

set nocompatible
set noerrorbells
set history=1000
set undolevels=500
set nobackup noswapfile

set tabstop=2 shiftwidth=2 backspace=2 expandtab

set backspace=indent,eol,start
set splitright splitbelow
set autoindent nowrap
set incsearch nohlsearch
set cino+=(0)


" --------------------------------- "
" ------------ Bundles ------------ "
" --------------------------------- "

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'jgdavey/tslime.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/tComment'
Plugin 'Yggdroot/indentLine'
Plugin 'zhaocai/GoldenView.Vim'

" --- Language Specific --- "

" Ruby
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'

" JSON
Plugin 'elzr/vim-json'

" Java
Plugin 'akhaku/vim-java-unused-imports'

" Scala
Plugin 'derekwyatt/vim-scala'

" Go
Plugin 'fatih/vim-go'

" HTML / CSS
Plugin 'mattn/emmet-vim'


call vundle#end()
filetype plugin indent on

" --------------------------------- "
" ------------- Theme ------------- "
" --------------------------------- "

syntax enable

set t_Co=256 t_ut=
set bg=dark

let base16colorspace=256
colorscheme base16-ocean

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

"           vim-rspec               "
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>

"           Tabularize              "
vmap <Leader>a=  :Tabularize /=<CR>
vmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a,  :Tabularize /,\zs<CR>
vmap <Leader>a:  :Tabularize /:\zs<CR>
" vmap <leader>a|  :Tabularize /|/l1<CR>

"              TSlime               "
map <leader>Tn :call ResetTSlimePaneNumber()<CR>
map <leader>Ts :call ResetTSlimeVars()<CR>

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

"            vim-go                 "
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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

" --------------------------------- "
" ---- Additional File Support ---- "
" --------------------------------- "
au FileType json setf javascript
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au BufRead,BufNewFile *.{hiccup,cljs,edn,cljx}           setf clojure
au BufRead,BufNewFile Vagrantfile                        setf ruby

augroup speclj
  autocmd!

  au BufNewFile,BufRead *_spec.clj let b:clojure_syntax_keywords = {
      \   'clojureMacro': ["describe", "context", "before", "before-all", "after", "after-all", "around", "it"],
      \   'clojureFunc':  ["should==", "should=", "should", "should-be", "should-be-a", "should-be-nil", "should-be-same",
      \                    "should-contain", "should-fail", "should-have-invoked", "should-invoke", "should-not", "should-not-be", "stub"]
      \ }
augroup END

augroup filetype_clojure
  autocmd!

  autocmd FileType clojure setlocal lispwords+=describe,it,context,around
  autocmd FileType clojure :AddTabularPattern! ns_separator /\(\ \)\@<=\(\(:as\)\|\(:refer\)\|\(:only\)\|\(:exclude\)\)
  autocmd FileType clojure nnoremap <buffer> <localleader>ns1 v%:s/\(\w\)\ \{2,}/\1\ /e<esc>
  autocmd FileType clojure nnoremap <buffer> <localleader>ns2 v%:Tabularize ns_separator<cr>
augroup END

autocmd BufRead,BufWritePre *.java :UnusedImports

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

function! ResetTSlimeVars()
  execute "normal \<Plug>SetTmuxVars"
endfunction

function! ResetTSlimePaneNumber()
  let g:tslime['pane'] = input("pane number: ", "", "custom,Tmux_Pane_Numbers")
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
