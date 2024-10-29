local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.SERVERS = {
    'pyright',       -- python
    -- 'jedi_language_server', -- python
    'ts_ls',      -- typescript/javascript
    'lua_ls',        -- lua
    'rust_analyzer', -- rust
    'texlab',        -- latex
    'cmake',         -- cmake
    'hls',           -- haskell
    'clangd',        -- C/C++
    'lemminx',       -- xml
}
return M
