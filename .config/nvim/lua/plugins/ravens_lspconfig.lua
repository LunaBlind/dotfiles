local M = {}

function M.on_attach(client, buff)
    local no_format = {sumneko_lua = true, pylsp = true, tsserver = true}
    if no_format[client.name] ~= nil then
	-- if client.name == "sumneko_lua" or client.name == "pylsp" or client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end

	local function map(key, cmd)
		local opt = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(buff, "n", "<leader>g" .. key, cmd, opt)
	end
	local function bmap(key, cmd)
		map(key, ":lua vim.lsp.buf." .. cmd .. "()<CR>")
	end
	local function dmap(key, cmd)
		map(key, ":lua vim.diagnostic." .. cmd .. "<CR>")
	end
	local function mapC(key, cmd)
		local opt = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(buff, "n", "<leader>G" .. key, cmd, opt)
	end
	local function bmapC(key, cmd)
		mapC(key, ":vs%<CR><C-W><C-P>:lua vim.lsp.buf." .. cmd .. "()<CR>")
	end

	local floatcfg =
		[[{focusable=false,source="if_many",close_events={"BufLeave","CursorMoved","InsertEnter","FocusLost"}}]]

	bmap("d", "definition")
	bmapC("d", "definition")
	bmap("D", "declaration")
	bmapC("D", "declaration")
	bmap("i", "implementation")
	bmapC("i", "implementation")
	bmap("h", "hover")
	bmap("r", "references")
	bmap("R", "rename")
	bmap("s", "signature_help")
	bmap("a", "code_action")
	bmap("f", "formatting")
	dmap("n", "goto_next()")
	dmap("p", "goto_prev()")
	dmap("l", "open_float(" .. floatcfg .. ")")
	dmap("L", "setloclist()")
	map("I", ":LspInfo<CR>")

	-- Format on save if formatting is available
	--[==[
	if client.server_capabilities.document_formatting then
		vim.cmd([[
            augroup LSP_FORMAT
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 5000)
            augroup END
        ]])
	end
    ]==]

	-- highlight keyword under cursor
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

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

function M.setup()
	-- configure diagnostics
	vim.diagnostic.config({
		virtual_text = {
			-- source = "if_many",
			source = true,
		},
	})

	-- configure handlers
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "rounded" }
	)

	local default_config = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	}

	local lspconfig = require("lspconfig")
	for _, lsp in ipairs(require("plugins.lsp").SERVERS) do
		local server_config = require("plugings.lsp." .. lsp) or {}
		local config = vim.tbl_extend("keep", server_config, default_config)
		lspconfig[lsp].setup(config)
	end
end

return M
