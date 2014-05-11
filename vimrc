source ~/.vimrc.bundles

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
set autoindent
set incsearch hlsearch

filetype plugin indent on


" --------------------------------- "
" ------------- Theme ------------- "
" --------------------------------- "

syntax enable

set t_Co=256
set t_ut=
" set t_ti= t_te=
set bg=dark

colorscheme lucius

set nocursorcolumn nocursorline
set synmaxcol=800
set list listchars=tab:»·,trail:·
set showtabline=1
set fillchars=vert:˙
set number numberwidth=2
set foldcolumn=0
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

"            Syntastic              "
let g:syntastic_check_on_open=1

"            GitGutter              "
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"           GoldenView              "
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-L> <Plug>GoldenViewSplit

"            VimRspec               "
let g:rspec_command = 'call Send_to_Tmux("clear\n bundle exec rspec {spec}\n")'
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>

"         Clojure Static            "
let g:clojure_align_multiline_strings = 1

"           vimclojure              "
let vimclojure#DynamicHighlighting=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1

"           Tabularize              "
vmap <Leader>a= :Tabularize /=/<CR>

"            Scratch                "
let g:scratch_height = 10
let g:scratch_top = 1


" --------------------------------- "
" -------------- MISC ------------- "
" --------------------------------- "

let g:html_indent_tags = 'li\|p'
let g:vim_markdown_folding_disabled=1

nnoremap <silent><C-h><C-l> :nohl<CR>

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

map <Leader>rf :call RenameFile()<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>


" --------------------------------- "
" ---- Additional File Support ---- "
" --------------------------------- "

au BufRead,BufNewFile *.hiccup                           setf clojure
au BufRead,BufNewFile *.json                             setf javascript
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown


" --------------------------------- "
" ----------- Functions ----------- "
" --------------------------------- "

function! <SID>SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()

