augroup typescript
  " nnoremap <silent> <F12> <Esc>:YcmCompleter GoTo<cr>
  " nnoremap <silent> <F11> <Esc>:YcmCompleter GoToReferences<cr>
  " nnoremap <F5> <Esc>:w <cr>:!tsc %<cr>
  nnoremap <F5> <Esc>:w <cr>:!tsc % && node %:r.js<cr>
  autocmd!
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
  setlocal autoindent
augroup END 
