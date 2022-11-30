augroup python
  autocmd!
  " nnoremap <silent> <F12> <Esc>:YcmCompleter GoTo<cr>
  " nnoremap <silent> <F11> <Esc>:YcmCompleter GoToReferences<cr>
  " nnoremap <F5> <Esc>:w<cr> :! clear && python %<cr>
  " nnoremap <F6> <Esc>:w<cr> :! clear && mypy %<cr>
  " nnoremap <F7> <Esc>:w<cr> :! cd ~/dev/Z-Server/zserver && clear && ls && python manage.py test<cr>
  " nnoremap <F7> <Esc>:w<cr> :! cd . && clear && ls && python manage.py test<cr>
  " nnoremap <F7> <Esc>:w<cr> :! clear && ls && python manage.py test <cr>
  " nnoremap <F6> <Esc>:w<cr> :! clear && mypy --ignore-missing-imports % && python % && ~/.scripts/script_done.sh %<cr>
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal autoindent
  setlocal smartindent
  setlocal fileformat=unix
  " setlocal foldmethod=indent " Enable Folding

  " let g:python_pep8_indent_multiline_string
  " setlocal iabbrev CC """<cr>:put =strftime(\"%c\")Copyright 2018 Felix Blind, all rights reserved.<cr>"""
augroup END 
