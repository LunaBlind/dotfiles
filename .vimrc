syntax on

" nnoremap <up> <nop>
" nnoremap <down> <nop>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" nnoremap <F5> <esc> :w <cr> :!python % <cr>
" nnoremap <F6> <esc> :w <cr> :! docker build -t turtlebot_image . <cr>
" nnoremap <F7> <esc> :w <cr> :!./% <cr>
" nnoremap <F8> <esc> :w <cr> :!pandoc % -o test.pdf <cr> :!evince test.pdf <cr>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set smartcase
set incsearch
set hlsearch
set shortmess+=I
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set noswapfile
set nu
set encoding=utf-8

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'lervag/vimtex'
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

let g:vimtex_view_method = 'mupdf'
