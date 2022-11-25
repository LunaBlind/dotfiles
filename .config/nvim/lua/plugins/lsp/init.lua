local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.SERVERS = {
    'pyright', -- python
    'tsserver', -- typescript/javascript
	'sumneko_lua', -- lua
	'rust_analyzer', -- rust
    'texlab', -- latex
    'cmake', -- cmake
    'hls', -- haskell
    'clangd', -- C/C++
}
return M
