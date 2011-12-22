set hidden " lets you switch buffers without saving

" switch buffers
nnoremap <Leader><Leader> <C-^>

" switch to adjacent buffer in current window
nnoremap <C-,> :bprev<Enter>
nnoremap <C-.> :bnext<Enter>

" close current buffer while retaining window
nnoremap <Leader>$ :execute 'bnext<Bar>bdelete' bufnr('%')<Enter>
