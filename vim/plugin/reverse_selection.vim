vnoremap <C-R> :s/\%V.*\%V./\=join(reverse(split(submatch(0))))/<CR>
