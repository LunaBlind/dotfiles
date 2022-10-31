augroup scala
  autocmd!
  " nnoremap <F5> <Esc>:w<cr>:!clear; scalac %; scala %:r<cr>
  nnoremap <F5> <Esc>:w<cr>:!clear; scala %<cr>

  setlocal textwidth=0
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
augroup END 

