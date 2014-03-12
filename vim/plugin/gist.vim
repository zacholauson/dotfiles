let g:gist_clip_command = 'pbcopy' " copy gist code to mac clipboard
let g:gist_detect_filetype = 1     " detect filetype from filename
let g:gist_show_privates = 1       " show private gists
let g:gist_post_private = 1        " create gists as private by default

" in visual mode ctrl + gg post selected text to gist
vnoremap <C-g><C-g> :Gist<CR>

" in normal mode ctrl + gg post whole file to gist
nnoremap <C-g><C-g> :Gist<CR>
