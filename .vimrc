set nocompatible
syntax on
set autoindent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
set clipboard+=unnamed
set backspace=indent,eol,start

set background=dark
colorscheme murphy

filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"Color Scheme
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'vyshane/vydark-vim-color'
NeoBundle 'vim-scripts/github-theme'
NeoBundle 'vim-scripts/tango.vim'
NeoBundle 'vim-scripts/vylight'
NeoBundle 'tomasr/molokai'

NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/brainfuck-syntax'
NeoBundle 'scrooloose/syntastic'

call neobundle#end()

let g:syntastic_brainfuck_checker = 'brainfuck-syntax'

filetype plugin on
filetype indent on

let $BASH_ENV=expand('~/.bashenv')

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

"If there are uninstalled bundles found on startup,
"this will conveniently prompt you to install them.
NeoBundleCheck
