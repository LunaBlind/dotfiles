augroup matlab
  " autocmd BufEnter *.m source $HOME/.vim/compiler/mlint.vim
  " nnoremap <F5> <Esc>:w<cr> :! clear && octave %<cr>
  nnoremap <buffer> <Leader>r :w <cr> :MatlabRun <cr>
  " nnoremap <F5> <Esc>:w<cr> :! clear <cr> :MatlabRun <cr>
  " nnoremap <F5> <Esc>:w<cr> :! clear && matlab -nodesktop -nosplash % "try, run %:p, pause, catch, end, quit" <CR> "
	" :! ~/.local/MATLAB/R2022a/bin/matlab -nodesktop -nosplash -r "try, run %:p, pause, catch, end, quit" <CR> <CR>
  au FileType matlab setlocal commentstring=%%s

  " au FileType matlab setlocal commentstring=#\ %s
  " setlocal tabstop=4
  " setlocal softtabstop=4
  " setlocal shiftwidth=4
  setlocal autoindent
  setlocal smartindent
  setlocal fileformat=unix
augroup END

