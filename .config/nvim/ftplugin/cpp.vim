augroup cpp
  autocmd!
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal noexpandtab
  " setlocal autoindent
  setlocal fileformat=unix
  " nnoremap <f5> <esc>:w<cr> :! clear; g++ % --std=c++17 -Wall -Wno-unused-variable -o %:r && ./%:r<cr>

augroup END 

