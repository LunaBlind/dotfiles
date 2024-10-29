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
--
-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Native LSP Setup
-- get pyright -> on PATH -> install pyright
-- tell nvim to use pyright
local on_attach = function(client, bufnr)
    -- local function buf_set_keymap(...)
    -- vim.api.nvim_buf_set_keymap(bufnr, ...)
    -- end

    -- Mappings.
    local opts = { noremap = true, silent = true, buffer = bufnr }

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
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)

    -- you can reuse a shared lspconfig on_attach callback here
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format({ bufnr = bufnr })
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
    -- if client.supports_method("textDocument/document_highlight") then
    if client.server_capabilities.document_highlight then
        vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
    end

    --- Guard against servers without the signatureHelper capability
    if client.server_capabilities.signatureHelpProvider then
        require('lsp-overloads').setup(client, {
            -- UI options are mostly the same as those passed to vim.lsp.util.open_floating_preview
            ui = {
                border = "single", -- The border to use for the signature popup window. Accepts same border values as |nvim_open_win()|.
                height = nil,      -- Height of the signature popup window (nil allows dynamic sizing based on content of the help)
                width = nil,       -- Width of the signature popup window (nil allows dynamic sizing based on content of the help)
                wrap = true,       -- Wrap long lines
                wrap_at = nil,     -- Character to wrap at for computing height when wrap enabled
                max_width = nil,   -- Maximum signature popup width
                max_height = nil,  -- Maximum signature popup height
                -- Events that will close the signature popup window: use {"CursorMoved", "CursorMovedI", "InsertCharPre"} to hide the window when typing
                close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
                focusable = true, -- Make the popup float focusable
                focus = false,    -- If focusable is also true, and this is set to true, navigating through overloads will focus into the popup window (probably not what you want)
                offset_x = 0,     -- Horizontal offset of the floating window relative to the cursor position
                offset_y = 0      -- Vertical offset of the floating window relative to the cursor position
            },
            keymaps = {
                next_signature = "<C-j>",
                previous_signature = "<C-k>",
                next_parameter = "<C-l>",
                previous_parameter = "<C-h>",
            },
        })
    end

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'rounded' }
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'rounded' }
    )
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    })
end

local default_config = {
    capabilities = lsp_defaults.capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 }
}

for _, lsp in ipairs(require("plugins.lsp").SERVERS) do
    local server_config = require("plugins.lsp." .. lsp) or {}
    local config = vim.tbl_extend("keep", server_config, default_config)
    if lsp == "tsserver" then
      lsp = "ts_ls"
    end
    lspconfig[lsp].setup(config)
end

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
