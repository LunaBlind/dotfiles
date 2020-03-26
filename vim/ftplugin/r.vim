" let R_assign=0
" let R_close_term=1 "  Close terminal buffer after R quited
" let R_nvim_pager=1 " use vim to see R documentation 

augroup R
  autocmd!
    let r_syntax_folding = 1
    let R_tmux_split = 1
  " au BufNewFile,BufRead *.R <localleader>rf
  " Press Enter to send lines and selection to R:
  " au FileType r vnoremap <buffer> <ENTER> <Plug>RDSendSelection
  " au FileType r nnoremap <buffer> <ENTER> <Plug>RDSendFile
  " au FileType r nnoremap <buffer> <Space> <Plug>RDSendLine
  " au FileType r nnoremap <buffer> <Space> \l
    nnoremap <LocalLeader>sr <Plug>RStart
    nnoremap <Space> <Plug>RDSendLine
augroup END 

