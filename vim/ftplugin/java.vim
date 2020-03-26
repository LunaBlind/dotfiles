augroup java
  nnoremap <F5> <Esc>:w<cr> :! clear && javac %; cd %:h; java %:t:r<cr>
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal autoindent
augroup END 
