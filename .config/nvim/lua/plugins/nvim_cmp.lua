-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Set up nvim-cmp.
local cmp = require 'cmp'
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ["<CR>"] = cmp.mapping(
        --   cmp.mapping.confirm {
        --     behavior = cmp.ConfirmBehavior.Insert,
        --     select = true,
        --   },
        --   { "i", "c" }
        -- ),

        ["<c-space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(
            _ --[[fallback]]
            )
                if cmp.visible() then
                    if not cmp.confirm { select = true } then
                        return
                    end
                else
                    cmp.complete()
                end
            end,
        },
    },

    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            before = function(entry, item)
                item.menu = ({
                    luasnip = "[Snip]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    buffer = "[Buff]",
                    path = "[Path]",
                    cmdline = "[cmd]",
                    digraphs = "[digr]",
                })[entry.source.name]
                return item
            end
        })
    },

    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer', keyword_length = 3 },
    },
    experimental = {
        native_menu = false,

        -- Let's play with this for a day or two
        ghost_text = true,
    },
}

-- search has buffer completion
cmp.setup.cmdline("/", { sources = {
    { name = "buffer" },
} })

cmp.setup.cmdline(":", { sources = {
    { name = "path" },
    { name = "cmdline" },
} })
-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
-- sources = cmp.config.sources({
--   { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
-- }, {
--   { name = 'buffer' },
-- })
-- })

-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = {
--   { name = 'buffer' }
-- }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = cmp.config.sources({
--   { name = 'path' }
-- }, {
--   { name = 'cmdline' }
-- })
-- })

-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
-- capabilities = capabilities
-- }
