augroup snippets
  autocmd!
  au FileType sml :iabbrev <buffer> fun fun () =<left><left><left><left><left>
  au FileType sml :iabbrev <buffer> let let<CR>in<CR>end<up><up>
  au FileType sml :iabbrev <buffer> in idonottypethis
  au FileType sml :iabbrev <buffer> end idonottypethis
  " python docstring. Delimitmate has to be turned of. Otherwise it would
  " interfere with the quotation marks.
  au FileType python :iabbrev <buffer> def <esc>:DelimitMateOff<cr>idef ():<cr>"""<cr>"""<up><up><left><left><left><esc>:DelimitMateOn<cr>a
  au FileType python :iabbrev <buffer> CC  <esc>:DelimitMateOff<cr>i"""<esc>:put =strftime(\"%c\")<cr>A, Felix Blind<cr>felixblind@gmail.com<cr>"""<cr><esc>:DelimitMateOn<cr>i
augroup END 

