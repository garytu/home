set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
" Plugins " 
call vundle#rc()
Bundle "vundle"
Bundle "mrtazz/molokai.vim"
Bundle "jammy.vim"
Bundle "xoria256.vim"
Bundle "eclm_wombat.vim"
colorscheme eclm_wombat 
Bundle "mileszs/ack.vim"
Bundle "tpope/vim-fugitive"
" Bundle "wincent/Command-T"
Bundle "genutils"
Bundle "The-NERD-tree"
Bundle "python.vim--Vasiliev"
" Bundle "taglist.vim"
Bundle "a.vim"
Bundle "kien/ctrlp.vim"
Bundle "majutsushi/tagbar"
Bundle "vimgdb_runtime"

" delegate configurations to files in .vim/config
runtime! config/**/*.vim
"runtime! config/bundle/*.vim:
