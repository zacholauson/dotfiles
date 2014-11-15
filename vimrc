let mapleader = " "
let g:netrw_liststyle=3

set nocompatible
set noerrorbells
set history=1000
set undolevels=500
set nobackup noswapfile

set tabstop=2 shiftwidth=2 backspace=2 expandtab

au FileType java setl tabstop=4 shiftwidth=4 expandtab
au FileType xml  setl tabstop=4 shiftwidth=4 expandtab

set backspace=indent,eol,start
set splitright splitbelow
set autoindent nowrap
set incsearch nohlsearch

" --------------------------------- "
" ------------ Bundles ------------ "
" --------------------------------- "

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'

" --- Language Specific --- "
Plugin 'vim-scripts/tComment'
Plugin 'Yggdroot/indentLine'
Plugin 'ervandew/supertab'

" Ruby
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/surround.vim'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-classpath'
Plugin 'vim-scripts/VimClojure'

" --- Git --- "
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" --- Movement --- "
Plugin 'scrooloose/nerdtree'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

Plugin 'itchyny/lightline.vim'

Plugin 'jnwhiteh/vim-golang'

call vundle#end()
filetype plugin indent on

filetype plugin indent on

" --------------------------------- "
" ------------- Theme ------------- "
" --------------------------------- "

syntax enable

set t_Co=256
set t_ut=
set bg=dark

colorscheme lucius
" colorscheme seoul256
" colorscheme github

set nocursorcolumn nocursorline
set synmaxcol=800
set list listchars=tab:»·,trail:·
set showtabline=1
set fillchars=vert:˙
set number numberwidth=2
set foldcolumn=0

let g:lightline = {
      \ 'colorscheme': 'solarized_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
\ }

set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

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
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

vnoremap <C-g><C-g> :Gist<CR>
nnoremap <C-g><C-g> :Gist<CR>

"           GoldenView              "
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-L> <Plug>GoldenViewSplit

"            VimRspec               "
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>

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

"              TSlime               "

map <leader>Tn :call ResetTSlimePaneNumber()<CR>
map <leader>Ts :call ResetTSlimeVars()<CR>

"              CtrlP                "
let g:ctrlp_user_command = 'ag %s -f -l --nocolor -g ""'
let g:ctrlp_extensions = ['funky']
nmap <Leader>cf :CtrlPFunky<Cr>
nmap <Leader>cF :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"           IndentLine              "
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'


" --------------------------------- "
" -------------- MISC ------------- "
" --------------------------------- "

let g:html_indent_tags = 'li\|p'
let g:vim_markdown_folding_disabled = 1
nnoremap <silent><C-h><C-l> :nohl<CR>
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
map <Leader>rf :call RenameFile()<cr>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>pp :setlocal paste!<cr>

" copy / paste to mac clipboard
nnoremap <leader>c "*yy
vnoremap <leader>c "*y
nnoremap <leader>v "*p
vnoremap <leader>v "*p


" --------------------------------- "
" ---- Additional File Support ---- "
" --------------------------------- "

au BufRead,BufNewFile *.json                             setf javascript
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

augroup speclj
  autocmd!

  au BufNewFile,BufRead *_spec.clj let b:clojure_syntax_keywords = {
      \   'clojureMacro': ["describe", "context", "before", "before-all", "after", "after-all", "around", "it"],
      \   'clojureFunc':  ["should==", "should=", "should", "should-be", "should-be-a", "should-be-nil", "should-be-same", "should-contain", "should-fail", "should-have-invoked", "should-invoke", "should-not", "should-not-be", "stub"]
      \ }

augroup END

augroup filetype_clojure
  autocmd!

  autocmd BufNewFile,BufRead *.hiccup set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs   set filetype=clojure
  autocmd BufNewFile,BufRead *.edn    set filetype=clojure
  autocmd BufNewFile,BufRead *.cljx   set filetype=clojure

  autocmd FileType clojure setlocal lispwords+=describe,it,context,around
  autocmd FileType clojure :AddTabularPattern! ns_separator /\(\ \)\@<=\(\(:as\)\|\(:refer\)\|\(:only\)\|\(:exclude\)\)
  autocmd FileType clojure nnoremap <buffer> <localleader>ns1 v%:s/\(\w\)\ \{2,}/\1\ /e<esc>
  autocmd FileType clojure nnoremap <buffer> <localleader>ns2 v%:Tabularize ns_separator<cr>
augroup END


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
