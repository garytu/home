" remove menu/toolbar
set guioptions-=m
set guioptions-=T
set nonumber
set showmatch

" bracket blinking in tenths of a second
set matchtime=5

set novisualbell
set noerrorbells
"set vb t_vb=
set ruler
set cursorline
" display incomplete command in lower right corner
set showcmd

" invisible characters
set nolist
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

" enable syntax
syntax on
" automatically detect file types
filetype plugin indent on

" status line
set laststatus=2  " always show the status bar
set statusline=%f\ %m\ %r
set statusline+=%{fugitive#statusline()}
set statusline+=Line:%l/%L[%p%%]
set statusline+=\ Col:%v
set statusline+=\ Buf:#%n
set statusline+=\ [%b][0x%B]

