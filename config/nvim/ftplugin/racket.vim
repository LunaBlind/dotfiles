augroup lisp
  autocmd!
  au BufNewFile,BufRead silent *.rkt,*.rktl setlocal filetype=scheme
  au FileType scheme setlocal lisp

  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal autoindent
  setlocal smartindent
  setlocal fileformat=unix
augroup END 
