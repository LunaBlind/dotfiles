augroup sml
  autocmd!
  nnoremap <F5> <Esc>:w<cr>:!clear; sml <%<cr>
  nnoremap <F6> <Esc>:w<cr>:!clear; sml %<cr>
  
  " No automatic wrapping, rewrapping will wrap to 80
  setlocal textwidth=0
  setlocal formatoptions=cq
  setlocal wrapmargin=0

  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal commentstring=(*%s*)
  " let sml_coursera_interactive=1
  " let sml_coursera_clean_output=1
augroup END 

