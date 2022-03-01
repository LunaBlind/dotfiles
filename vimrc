if &compatible
    set nocompatible "do not act like vi
endif

syntax on

" nnoremap <up> <nop>
" nnoremap <down> <nop>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" nnoremap <F5> <esc> :w <cr> :!python % <cr>
" nnoremap <F6> <esc> :w <cr> :! docker build -t turtlebot_image . <cr>
" nnoremap <F7> <esc> :w <cr> :!./% <cr>
" nnoremap <F8> <esc> :w <cr> :!pandoc % -o test.pdf <cr> :!evince test.pdf <cr>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <leader>vimrc :vsplit $MYVIMRC<cr> " quickly edit vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> " quickly source vimrc

set smartcase
set incsearch
set hlsearch
set shortmess+=I
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set noswapfile
set number
set encoding=utf-8

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

if has('nvim')

	tnoremap <Esc> <C-\><C-n>

	" set runtimepath^=~/.vim runtimepath+=~/.vim/after
	" set &packpath = &runtimepath
	" source stdpath('config') . '/init.vim'

	call plug#begin(stdpath('data') . '/plugged')
	" call plug#begin('~/.config/nvim/plugged')
	Plug 'morhetz/gruvbox'
	Plug 'junegunn/vim-plug'
	"
	" Latex Plugins
	" Plug 'brennier/quicktex'
	Plug 'lervag/vimtex'
	" Plug 'honza/vim-snippets'
	" Plug 'sirver/ultisnips'

	
	" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
	" - https://github.com/Valloric/YouCompleteMe
	" - https://github.com/nvim-lua/completion-nvim
	" let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"

	Plug 'raimondi/delimitmate'
	 Plug 'joom/vim-commentary'
	" Plug 'Valloric/YouCompleteMe'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" use <tab> for trigger completion and navigate to the next complete item
	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~ '\s'
	endfunction

	inoremap <silent><expr> <Tab>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<Tab>" :
		  \ coc#refresh()

	" key mappings example
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gD <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	" there's way more, see `:help coc-key-mappings@en'
	"
	" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	" delays and poor user experience.
	set updatetime=300
	"
	"
	" experimental
	Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

	" Plug 'davidhalter/jedi-vim'
	"
	Plug 'w0rp/ale'
	Plug 'tpope/vim-surround'

	Plug 'kien/rainbow_parentheses.vim'

	

	" Matlab
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" let g:deoplete#enable_at_startup = 1

	Plug 'daeyun/vim-matlab', { 'do': ':UpdateRemotePlugins' }
	
	Plug 'mwouts/jupytext', {'branch': 'main'}
	" Plug 'daeyun/vim-matlab'
	"
	" Plug 'benmills/vimux'

	call plug#end()

else

	call plug#begin('~/.vim/plugged')
	Plug 'morhetz/gruvbox'
	Plug 'junegunn/vim-plug'
	" Plug 'brennier/quicktex'
	Plug 'lervag/vimtex'
	Plug 'raimondi/delimitmate'
	Plug 'joom/vim-commentary'
	Plug 'Valloric/YouCompleteMe'
	Plug 'w0rp/ale'
	Plug 'tpope/vim-surround'

	Plug 'kien/rainbow_parentheses.vim'

call plug#end()

endif

filetype plugin on

colorscheme gruvbox

" matchit is a plugin which is shipped with vim, but not activated.
" Matchit enhances the functionality of the % command. When this plugin is
" enabled, the % command can jump between matching pairs of keywords.
runtime macros/matchit.vim

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
  " let base16colorspace=256  " Access colors present in 256 colorspace
  " Allow color schemes to do bright colors without forcing bold.
  set t_Co=256
  " colorscheme desert
  " colorscheme Tomorrow-Night
  let g:gruvbox_undercurl = 1
  let g:gruvbox_termcolors = 256
  let g:gruvbox_constrast_dark='soft'
  let g:gruvbox_underline=1
  " let g:gruvbox_color_column='red'
  set background=dark
endif

augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" let g:vimtex_view_method = 'mupdf'
" let g:vimtex_view_general_viewer = 'evince' 
let g:vimtex_view_general_viewer = 'zathura' 
let g:tex_flavor = 'latex'

" Ocaml
filetype indent on
au BufRead,BufNewFile *.ml,*.mli compiler ocaml
