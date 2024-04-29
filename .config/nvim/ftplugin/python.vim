augroup python
  autocmd!
  " nnoremap <silent> <F12> <Esc>:YcmCompleter GoTo<cr>
  " nnoremap <silent> <F11> <Esc>:YcmCompleter GoToReferences<cr>
	nnoremap <buffer> <leader>r :w<cr> :! clear; python %<cr>
  " nnoremap <leader>r :w<cr> :! python %<cr>
  nnoremap <F5> <Esc>:w<cr> :! clear && python %<cr>
	" nnoremap <silent> <F6> :lua require'dap'.continue()<CR>
	" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
	" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
	" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
	" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
	" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
	" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
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
