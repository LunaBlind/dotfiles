syntax on

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <F5> <esc> :w <cr> :!python % <cr>

set smartcase
set incsearch
set hlsearch
set shortmess+=I
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set noswapfile

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'raimondi/delimitmate'
Plug 'joom/vim-commentary'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
call plug#end()
filetype plugin on

augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
