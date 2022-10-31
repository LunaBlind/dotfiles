augroup java
  nnoremap <F5> <Esc>:w<cr> :! clear && javac %; cd %:h; java %:t:r<cr>
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal autoindent
augroup END 
