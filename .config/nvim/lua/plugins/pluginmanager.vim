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

