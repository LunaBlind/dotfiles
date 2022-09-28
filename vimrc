if &compatible
    set nocompatible "do not act like vi
endif

syntax on

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

nnoremap <leader>w :w <cr>
nnoremap <leader>q :q <cr>

set smartcase
set incsearch
set hlsearch
set shortmess+=c
set tabstop=8
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
set foldnestmax=2

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
    Plug 'junegunn/vim-plug'
    Plug 'morhetz/gruvbox'
    Plug 'raimondi/delimitmate'
    Plug 'joom/vim-commentary'

    " Latex Plugins
    Plug 'lervag/vimtex'
        let g:vimtex_view_general_viewer = 'zathura' 
        let g:tex_flavor = 'latex'
    Plug 'honza/vim-snippets'
    " Plug 'sirver/ultisnips'

    Plug 'w0rp/ale'
    Plug 'tpope/vim-surround'
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
    
    " Python
    Plug 'mwouts/jupytext', {'branch': 'main'}

    " Debugging
    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'

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
        set cmdheight=2

        " use <tab> for trigger completion and navigate to the next complete item
        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~ '\s'
        endfunction

        inoremap <silent><expr> <Tab>
                  \ pumvisible() ? "\<C-n>" :
                  \ <SID>check_back_space() ? "\<Tab>" :
                  \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
            imap <C-l> <Plug>(coc-snippets-expand)

            " Use <C-j> for select text for visual placeholder of snippet.
            vmap <C-j> <Plug>(coc-snippets-select)

            " Use <C-j> for jump to next placeholder, it's default of coc.nvim
            let g:coc_snippet_next = '<c-j>'

            " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
            let g:coc_snippet_prev = '<c-k>'

            " Use <C-j> for both expand and jump (make expand higher priority.)
            imap <C-j> <Plug>(coc-snippets-expand-jump)

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

" Ocaml
filetype indent on
au BufRead,BufNewFile *.ml,*.mli compiler ocaml
