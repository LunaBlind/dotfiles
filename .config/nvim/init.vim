set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if &compatible
    set nocompatible "do not act like vi
endif

:lua vim.g.mapleader = ' '
" :lua vim.g.maplocalleader = ','

syntax on

source ~/.config/nvim/lua/mappings/old_remap_mappings.vim
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

source ~/.config/nvim/lua/plugins/pluginmanager.vim

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
