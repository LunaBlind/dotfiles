-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Native LSP Setup
-- get pyright -> on PATH -> install pyright
-- tell nvim to use pyright
local on_attach = function(client, bufnr)
    -- local function buf_set_keymap(...)
		-- vim.api.nvim_buf_set_keymap(bufnr, ...)
	-- end

	-- Mappings.
	local opts = { noremap = true, silent = true, buffer=bufnr }

    -- buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	-- buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

	-- buf_set_keymap("n", "<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
	-- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	-- buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	-- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	-- buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	-- buf_set_keymap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)

	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- pass function but don't execute it (like in lisp)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)

    -- you can reuse a shared lspconfig on_attach callback here
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format({ bufnr = bufnr})
            end,
        })
    end
    -- if client.server_capabilities.document_formatting then
		-- vim.cmd([[
			-- augroup formatting
				-- autocmd! * <buffer>
				-- autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				-- autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			-- augroup END
		-- ]])
	-- end

	-- -- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
	end

end
 --connect to server

-- local servers = { 'clangd', 'sumneko_lua', 'pyright', 'tsserver', 'gopls' }
-- local nvim_lsp = require 'lspconfig'
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

local default_config = {
    capabilities = capabilities,
    on_attach = on_attach,
}

local lspconfig = require("lspconfig")
for _, lsp in ipairs(require("plugins.lsp").SERVERS) do
    local server_config = require("plugins.lsp." .. lsp) or {}
    local config = vim.tbl_extend("keep", server_config, default_config)
    lspconfig[lsp].setup(config)
end

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
