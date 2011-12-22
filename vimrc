set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
" Plugins " 
call vundle#rc()
Bundle "vundle"
Bundle "mrtazz/molokai.vim"
"Bundle "jammy.vim"
Bundle "xoria256.vim"
colorscheme molokai 
Bundle "mileszs/ack.vim"
Bundle "tpope/vim-fugitive"
Bundle "wincent/Command-T"
Bundle "genutils"
Bundle "The-NERD-tree"

" delegate configurations to files in .vim/config
runtime! config/**/*.vim
"runtime! config/bundle/*.vim:
