" In MakTefiles, use real tabs, not tabs expanded to spaces
au FileType make set noexpandtab
" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript
" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

