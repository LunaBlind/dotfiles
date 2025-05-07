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

lua require('options')

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

" call plug#begin(stdpath('data') . '/plugged')
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-plug'
Plug 'morhetz/gruvbox'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'w0rp/ale'
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
      \ 'colorscheme': 'darcula',
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
    " let g:vimtex_compiler_latexmk = {
    "   \ 'build_dir' : '',
    "   \ 'callback' : 1,
    "   \ 'continuous' : 1,
    "   \ 'options' : [
    "   \   '-pdf',
    "   \   '-interaction=nonstopmode',
    "   \   '-synctex=1',
    "   \ ],
    "   \}

    " Define a custom callback to clean auxiliary files after compilation
    function! CleanAuxiliaryFiles()
      silent !latexmk -c
      silent !rm *.aux *.fls *.log *.fdb_latexmk *.synctex.gz *.toc *.out *.bbl *.blg
    endfunction

    augroup vimtex_clean
      autocmd!
      autocmd User VimtexEventCompileSuccess call CleanAuxiliaryFiles()
    augroup END

Plug 'honza/vim-snippets'
" Plug 'sirver/ultisnips'
"   let g:UltiSnipsExpandTrigger="<A-i>"
"   let g:UltiSnipsJumpForwardTrigger="<A-j>"
"   let g:UltiSnipsJumpBackwardTrigger="<A-k>"

" Python
Plug 'mwouts/jupytext', {'branch': 'main'}


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

" function! s:JbzClangFormat(first, last)
"   let l:winview = winsaveview()
"   execute a:first . "," . a:last . "!clang-format"
"   call winrestview(l:winview)
" endfunction
" command! -range=% JbzClangFormat call <sid>JbzClangFormat (<line1>, <line2>)

" au FileType c,cpp nnoremap <buffer><leader>lf :<C-u>JbzClangFormat<CR>
" au FileType c,cpp vnoremap <buffer><leader>lf :JbzClangFormat<CR>

" Matlab
Plug 'MortenStabenau/matlab-vim'

" LSP-Setup
Plug 'neovim/nvim-lspconfig'
Plug 'Issafalcon/lsp-overloads.nvim'
" Plug 'ray-x/lsp_signature.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'onsails/lspkind.nvim'
" Plug 'hrsh7th/lspkind-nvim'
" Plug 'hrsh7th/cmp-cmdline'
"
" Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" " follow latest release and install jsregexp.
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'benfowler/telescope-luasnip.nvim'
Plug 'LinArcX/telescope-env.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
" Plug 'mfussenegger/nvim-dap-python'
" Plug 'leoluz/nvim-dap-go'
" Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

" Plug 'Shatur/neovim-tasks'

" null-ls
Plug 'jose-elias-alvarez/null-ls.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" ROS
" Plug 'thibthib18/ros-nvim'

" Plug 'taketwo/vim-ros'
" let g:ros_make="all" "just deleted the ros_make line in __init__.py of the plugin
" let g:ros_catkin_make_options='run_tests -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Release'

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

lua <<EOF
-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
vim.opt.completeopt={"menu", "menuone", "noselect"}
vim.g.snippets = "luasnip"
require'plugins.telescope'
require'plugins.lspconfig'
require'plugins.nvim-treesitter.config'
-- require'plugins.lspconfig'
require'plugins.luasnip'
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()
-- require'plugins.cmp'
-- require'plugins.nvim-dap'
-- require'plugins.nvim-dap-ui'
-- require'plugins.nvim-dap-virtual-text'
-- require'plugins.null-ls'
require'plugins.nvim_cmp'
-- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require'plugins.gitsigns'
-- require'plugins.ros-nvim'

require'mappings.leader'
EOF
