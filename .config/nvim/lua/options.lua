-- local set           = vim.opt
vim.opt.smartcase   = true
vim.opt.incsearch   = true
vim.opt.hlsearch    = true
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smarttab    = true
vim.opt.autoindent  = true
vim.opt.swapfile    = false
vim.opt.number      = true

vim.opt.encoding    = "utf-8"

vim.opt.shortmess:append "c"
vim.opt.wildignore:append "*.o"                      -- Compiled object files
vim.opt.wildignore:append "*.pyc"                    -- Python bytecode
vim.opt.wildignore:append "*.aux,*.out,*.toc"        -- LaTeX output
vim.opt.wildignore:append "*.jpg,*.jpeg,*.gif,*.png" -- Binary images
vim.opt.wildignore:append ".hg,.git,.svn"            -- VCS
vim.opt.wildignore:append "*~"                       -- Backup files
vim.opt.wildignore:append "*.pdf"                    -- pdfs

vim.opt.textwidth   = 0
vim.opt.wrapmargin  = 0
vim.opt.wrap        = true
vim.opt.linebreak   = true

vim.opt.foldenable  = true
vim.opt.foldmethod  = "expr"
vim.opt.foldexpr    = "nvim_treesitter#foldexpr()"
-- " vim.opt foldmethod=indent
-- " vim.opt foldmethod=syntax
vim.opt.foldnestmax = 6
-- " vim.opt fillchars=fold:\
vim.opt.updatetime  = 300

-- "this is from https://idie.ru/posts/vim-modern-cpp/

vim.opt.undofile    = true
vim.opt.undodir     = "$HOME/.local/share/nvim/undo"
vim.opt.undolevels  = 1000
vim.opt.undoreload  = 10000

-- " vim.opt showmatch                               " Show matching brackets when text indicator is over them
vim.opt.mat         = 1 -- How many tenths of a second to blink when matching brackets
vim.opt.re          = 1 -- Required for vista.vim: https://github.com/liuchengxu/vista.vim/issues/82
-- " vim.opt clipboard=unnamedplus,unnamed
-- " set signcolumn=yes
