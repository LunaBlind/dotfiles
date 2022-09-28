augroup ocaml
  autocmd!
  
	set sb
  nnoremap <F5> <Esc>:w<cr> :! clear && ocaml %<cr>
  " nnoremap <F5> <Esc>:w<cr> :! clear && dune utop .<cr>

	"
  " setlocal textwidth=0
  " setlocal tabstop=2
  " setlocal softtabstop=2
  " setlocal shiftwidth=2
  setlocal commentstring=(*%s*)
augroup END 

