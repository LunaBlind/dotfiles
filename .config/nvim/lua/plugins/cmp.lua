local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        -- expand snippets
        ["<leader>e"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.confirm({ select = false })
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        ["<leader>u"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- scroll docs up
        ["<C-u>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.mapping.scroll_docs(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- scroll docs down
        ["<C-d>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.mapping.scroll_docs(1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- next choice node
        ["<C-n>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- prev choice node
        ["<C-p>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- next > expand > jump > complete > tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- prev > jump back > S-tab
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),
    },
    formatting = {
        fields = { "abbr", "menu" },
        format = function(entry, item)
            item.kind = nil -- kinds[item.kind]
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
        end,
    },
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = 'nvim_lsp_signature_help' },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "digraphs" },
    }),
    experimental = {
        ghost_text = true,
    },
})

-- search has buffer completion
-- `/` search in buffer
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- `:` command-line completion with path (no trailing slash) + cmdline
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        {
            name = 'path',
        },
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' },
            },
        },
    }),
})
