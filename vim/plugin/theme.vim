syntax enable

set t_Co=256
set t_ut=

set bg=dark
colorscheme base16-eighties

set nocursorcolumn " dont hl the cursors column
set nocursorline " dont hl the cursor line
set synmaxcol=800 " dont hl long lines

set list listchars=tab:»·,trail:·
set showtabline=1

set number
set numberwidth=2
set foldcolumn=0

set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
