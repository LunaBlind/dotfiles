set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if &compatible
    set nocompatible "do not act like vi
endif

:lua vim.g.mapleader = ' '
" :lua vim.g.maplocalleader = ','

syntax on

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
" set updatetime=300

"this is from https://idie.ru/posts/vim-modern-cpp/

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

tnoremap <Esc> <C-\><C-n>

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" set &packpath = &runtimepath
" source stdpath('config') . '/init.vim'

call plug#begin(stdpath('data') . '/plugged')
" call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-plug'
Plug 'morhetz/gruvbox'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'w0rp/ale'
Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1

Plug 'ludovicchabant/vim-gutentags'
    set tags=./tags;
    let g:gutentags_ctags_exclude_wildignore = 1
    let g:gutentags_ctags_exclude = [
      \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
      \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui']

Plug 'liuchengxu/vista.vim'
    nnoremap <silent> <A-6> :Vista!!<CR>

Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
  " {{{ Lightline
    set noshowmode
    let g:buftabline_indicators=1 " show modified

    let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \              [ 'current_function'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ]],
      \ },
      \ 'component': {
      \   'gitbranch': '%{gitbranch#name()}'
      \ },
      \ 'component_expand': {
      \   'lsp_warnings': 'LightlineLspWarnings',
      \   'lsp_errors': 'LightlineLspErrors',
      \ },
      \ 'component_type': {
      \   'lsp_warnings': 'warning',
      \   'lsp_errors': 'error',
      \   'readonly': 'error',
      \ },
      \ }

" Latex Plugins
Plug 'lervag/vimtex'
    let g:tex_flavor = 'latex'
    let g:vimtex_view_general_viewer = 'zathura' 
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal='abdmg'
Plug 'honza/vim-snippets'
" Plug 'sirver/ultisnips'
"   let g:UltiSnipsExpandTrigger="<A-i>"
"   let g:UltiSnipsJumpForwardTrigger="<A-j>"
"   let g:UltiSnipsJumpBackwardTrigger="<A-k>"

" Python
Plug 'mwouts/jupytext', {'branch': 'main'}

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'

" C++
" most of this came from https://idie.ru/posts/vim-modern-cpp/
Plug 'derekwyatt/vim-fswitch'
    au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
    au BufEnter *.cc let b:fswitchdst = "h,hpp"

    au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'

    nnoremap <silent> <A-o> :FSHere<cr>
    " Extra hotkeys to open header/source in the split
    nnoremap <silent> <localleader>oh :FSSplitLeft<cr>
    nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
    nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
    nnoremap <silent> <localleader>ol :FSSplitRight<cr>

Plug 'bfrg/vim-cpp-modern'

function! s:JbzClangFormat(first, last)
  let l:winview = winsaveview()
  execute a:first . "," . a:last . "!clang-format"
  call winrestview(l:winview)
endfunction
command! -range=% JbzClangFormat call <sid>JbzClangFormat (<line1>, <line2>)

au FileType c,cpp nnoremap <buffer><leader>lf :<C-u>JbzClangFormat<CR>
au FileType c,cpp vnoremap <buffer><leader>lf :JbzClangFormat<CR>

" Matlab
Plug 'MortenStabenau/matlab-vim'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " " don't give |ins-completion-menu| messages.
    " set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("nvim-0.5.0") || has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Give more space for displaying messages.
    set cmdheight=3

    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " Confirm completion with Enter. If nothing is selected use the first item.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

" GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " " Symbol renaming.
    " nmap <leader>rn <Plug>(coc-rename)

    " " Formatting selected code.
    " xmap <leader>f  <Plug>(coc-format-selected)
    " nmap <leader>f  <Plug>(coc-format-selected)

    " " Apply AutoFix to problem on the current line.
    " nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)


" Coc-Snippets
    " Use <C-l> for trigger snippet expand.
    imap <c-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <c-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <c-j> <Plug>(coc-snippets-expand-jump)

    " Use <leader>x for convert visual selected code to snippet
    xmap <leader>x  <Plug>(coc-convert-snippet)
"
"
" experimental
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Plug 'davidhalter/jedi-vim'
"
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

" let g:python3_host_prog = '/usr/lib/python3.9'
"lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
" local dap = require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
" require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
" lua dap = require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
"
" require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

" lua << EOF
" local dap = require('dap')
" dap.adapters.python = {
"   type = 'executable';
"   command = '~/.virtualenvs/debugpy/bin/python';
"   args = { '-m', 'debugpy.adapter' };
" }
" local dap = require('dap')
" dap.configurations.python = {
"   {
"     -- The first three options are required by nvim-dap
"     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
"     request = 'launch';
"     name = "Launch file";

"     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

"     program = "${file}"; -- This configuration will launch the current file if used.
"     pythonPath = function()
"       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
"       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
"       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
" 	  local venv = os.getenv("VIRTUAL_ENV")
" 	  local cwd = vim.fn.getcwd() .. string.format("%s/bin/python",venv)
"       if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
"         return cwd .. '/venv/bin/python'
"       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
"         return cwd .. '/.venv/bin/python'
"       else
"         return '/usr/bin/python'
"       end
"     end;
"   },
" }
" EOF
lua <<EOF
require'nvim-treesitter.config'
EOF
