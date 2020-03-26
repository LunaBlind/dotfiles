augroup matlab
  " autocmd BufEnter *.m source $HOME/.vim/compiler/mlint.vim
  nnoremap <F5> <Esc>:w<cr> :! clear && octave %<cr>
  au FileType matlab setlocal commentstring=%%s
  " setlocal tabstop=4
  " setlocal softtabstop=4
  " setlocal shiftwidth=4
  setlocal autoindent
  setlocal smartindent
  setlocal fileformat=unix
augroup END

