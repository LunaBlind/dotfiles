set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
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
source ~/.vimrc
