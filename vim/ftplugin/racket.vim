augroup lisp
  autocmd!
  au BufNewFile,BufRead silent *.rkt,*.rktl setlocal filetype=scheme
  au FileType scheme setlocal lisp
augroup END 
