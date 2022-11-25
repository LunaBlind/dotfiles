-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Native LSP Setup
-- get pyright -> on PATH -> install pyright
-- tell nvim to use pyright
local nvim_lsp = require 'lspconfig'
local on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- pass function but don't execute it (like in lisp)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
        -- vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0}) 
end
 --connect to server

local servers = { 'clangd', 'sumneko_lua', 'pyright', 'tsserver', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
