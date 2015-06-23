set nocompatible
syntax on
colorscheme desert
set autoindent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
set clipboard+=unnamed
set backspace=indent,eol,start

filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'derekwyatt/vim-scala'
call neobundle#end()

filetype plugin on
filetype indent on

"If there are uninstalled bundles found on startup,
"this will conveniently prompt you to install them.
NeoBundleCheck
