cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Buffer management
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <leader>cl :bprevious<CR>:bdelete #<CR>
nnoremap <leader>de :bdelete %<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <leader>vimrc :vsplit $MYVIMRC<cr> 
nnoremap <leader>sv :source $MYVIMRC<cr> 

nnoremap <leader>w :w <cr>
nnoremap <leader>q :q <cr>
"turns of search highlighting
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
nnoremap <A-j> :-tabmove<CR>
inoremap <A-j> <C-O>:-tabmove<CR>
nnoremap <A-k> :+tabmove<CR>
inoremap <A-k> <C-O>:+tabmove<CR>
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
" map <leader>rs :%s///g<left><left><left>
" map <leader>rl :s///g<left><left><left>
" here is from https://idie.ru/posts/vim-modern-cpp/

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

