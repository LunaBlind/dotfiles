augroup haskell 
  autocmd!
    " nnoremap <F5> <esc>:w<cr>:! clear; stack ghc -- -dynamic % && ./%:r<cr>
    nnoremap <F5> <esc>:w<cr>:! clear; stack runghc -- -dynamic % <cr>
    nnoremap <F6> <esc>:w<cr>:! clear; stack ghci %<cr>
  
  " setlocal textwidth=0
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal autoindent
augroup END 

