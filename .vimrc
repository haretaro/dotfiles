call plug#begin('~/.vim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'cespare/vim-toml'
Plug 'davidhalter/jedi-vim'
Plug 'tomasr/molokai'
call plug#end()

set nocompatible
syntax on
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start
set number
set ruler
set hlsearch
set showcmd
set listchars=tab:>.,eol:\ ,trail:_
set list
set cursorline
set visualbell
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp,utf-16le

let mapleader = "\<Space>"

"新しいタブ
nnoremap <Leader>t :tabnew<cr>

"タブ移動
nnoremap <C-Tab> gt
nnoremap <Leader><Tab> gt

"カッコ補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

if has('unix')
  colorscheme molokai
  set clipboard^=unnamedplus
endif

if has('mac')
  set clipboard=unnamed
  set background=light
  colorscheme molokai
endif
