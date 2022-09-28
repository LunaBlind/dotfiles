augroup vim
  autocmd!
  au filetype vim :iabbrev <buffer> augroup augroup<cr>autocmd!<cr>augroup end
  au filetype vim setlocal tabstop=2
  au filetype vim setlocal shiftwidth=2
  au filetype vim setlocal softtabstop=2
  au filetype vim setlocal foldmethod=marker
  au filetype vim setlocal foldlevelstart=2
augroup end

