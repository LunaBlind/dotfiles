augroup javascript
  autocmd!
  nnoremap <F5> :w<cr>:! clear && node %<cr>
  setlocal foldmethod=syntax
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal autoindent
augroup END 
