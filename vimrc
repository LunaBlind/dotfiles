if &compatible
    set nocompatible "do not act like vi
endif

syntax on

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Buffer management
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <leader>c :bprevious<CR>:bdelete #<CR>
nnoremap <leader>d :bdelete %<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <leader>vimrc :vsplit $MYVIMRC<cr> " quickly edit vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> " quickly source vimrc

nnoremap <leader>w :w <cr>
nnoremap <leader>q :q <cr>
nnoremap <leader>h :noh <cr>

" Copy selection to clipboard
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>

" this from here to ... from https://idie.ru/posts/vim-modern-cpp/
" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Fix common typos
:command! W w
:command! Q q
:command! E e

" Tabs managemenent
nnoremap <A-H> :-tabmove<CR>
inoremap <A-H> <C-O>:-tabmove<CR>
nnoremap <A-L> :+tabmove<CR>
inoremap <A-L> <C-O>:+tabmove<CR>
nnoremap <A-t> :tabnew<CR>
inoremap <A-t> <C-O>:tabnew<CR>
nnoremap <A-l> :tabnext<CR>
inoremap <A-l> <C-O>:tabnext<CR>
nnoremap <A-h> :tabprevious<CR>
inoremap <A-h> <C-O>:tabprevious<CR>
nnoremap <A-1>      1gt
inoremap <A-1> <C-O>1gt
nnoremap <A-2>      2gt
inoremap <A-2> <C-O>2gt
nnoremap <A-3>      3gt
inoremap <A-3> <C-O>3gt
nnoremap <A-4>      4gt
inoremap <A-4> <C-O>4gt
nnoremap <A-5>      5gt
inoremap <A-5> <C-O>5gt
nnoremap <A-6>      6gt
inoremap <A-6> <C-O>6gt
nnoremap <A-7>      7gt
inoremap <A-7> <C-O>7gt
nnoremap <A-8>      8gt
inoremap <A-8> <C-O>8gt
nnoremap <A-9>      9gt
inoremap <A-9> <C-O>9gt

" Find and Replace
map <leader>rs :%s///g<left><left><left>
map <leader>rl :s///g<left><left><left>
" here is from https://idie.ru/posts/vim-modern-cpp/

set smartcase
set incsearch
set hlsearch
set shortmess+=c
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set noswapfile
set number
set encoding=utf-8
set foldenable
set foldmethod=indent
" set foldmethod=syntax
set foldnestmax=6
" set fillchars=fold:\

"this is from https://idie.ru/posts/vim-modern-cpp/

" more permanent undo?
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" set showmatch                               " Show matching brackets when text indicator is over them
set mat=1                                   " How many tenths of a second to blink when matching brackets
set re=1                                    " Required for vista.vim: https://github.com/liuchengxu/vista.vim/issues/82
" set clipboard=unnamedplus,unnamed
" set signcolumn=yes
set wildignore+=*.o                         " Compiled object files
set wildignore+=*.pyc                       " Python bytecode
set wildignore+=*.aux,*.out,*.toc           " LaTeX output
set wildignore+=*.jpg,*.jpeg,*.gif,*.png    " Binary images
set wildignore+=.hg,.git,.svn               " VCS
set wildignore+=*~                          " Backup files
set wildignore+=*.pdf                       " pdfs

" Editing neighbors
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>ee :e 
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>ec :cd %%<cr>
map <leader>eC :cd ..<cr>

" Tmux https://github.com/jubnzv/dotfiles/blob/dd46c2d940c13a0db8d94b02934659018358579a/.config/nvim/init.vim#L208-L212
if exists('$TMUX')
  " Execute previous command in the last active pane
  nnoremap <silent> <leader><tab> :silent !tmux send-keys -t \! Up Enter<cr>
  nnoremap <silent> <leader><leader><tab> :silent !tmux clear-history -t right && tmux send-keys -t \! C-l Up Enter<cr>
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"this is from https://idie.ru/posts/vim-modern-cpp/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/ 
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

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

filetype plugin on

let g:gruvbox_sign_column='bg0'
let g:gruvbox_color_column='bg1'
let g:gruvbox_number_column='bg0'
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

" Ocaml
filetype indent on
au BufRead,BufNewFile *.ml,*.mli compiler ocaml
