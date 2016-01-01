set nocompatible
syntax on
set autoindent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2
set clipboard+=unnamed
set backspace=indent,eol,start
set number
set ruler
set hlsearch
set showcmd
set listchars=tab:>.,eol:\ ,trail:_
set list
set cursorline
set visualbell

"カッコ補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle Color Scheme
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'vyshane/vydark-vim-color'
NeoBundle 'vim-scripts/github-theme'
NeoBundle 'vim-scripts/tango.vim'
NeoBundle 'vim-scripts/vylight'
NeoBundle 'tomasr/molokai'

"NeoBundle Plugin
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-scripts/brainfuck-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make -f make_mac.mak',
  \   'unix' : 'make -f make_unix.mak',
  \ },
  \}

call neobundle#end()

set background=light
colorscheme molokai

"syntasticの設定
let g:syntastic_brainfuck_checker = 'brainfuck-syntax'
"activeに設定で常に構文チェック
"ただしscalaは構文チェックに時間がかかるのでpassiveに指定
"構文チェックする場合は:SyntasticCheck
let g:syntastic_mode_map = { "mode": "active",
      \"active_filetypes": [],
      \"passive_filetypes": ["scala"]}

filetype plugin on
filetype indent on

let $BASH_ENV=expand('~/.bashenv')

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

"If there are uninstalled bundles found on startup,
"this will conveniently prompt you to install them.
NeoBundleCheck
