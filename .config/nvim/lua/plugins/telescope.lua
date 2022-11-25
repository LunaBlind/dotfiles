local telescope = require("telescope")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		default_mappings = {
			i = {
				["<S-Tab>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-s>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<C-f>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},
			n = {
				["q"] = actions.close,
				["<S-Tab>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-s>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<Space>"] = actions.toggle_selection + actions.move_selection_previous,
				["J"] = actions.toggle_selection + actions.move_selection_next,
				["K"] = actions.toggle_selection + actions.move_selection_previous,
				["<C-A>"] = actions.toggle_all,
				["<C-c>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["?"] = actions.which_key, -- keys from pressing <C-/>
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
		spell_suggest = { theme = "cursor" },
		man_pages = { theme = "dropdown" },
		filetypes = { theme = "dropdown" },
		quickfix = { theme = "ivy" },
		diagnostics = { theme = "ivy" },
		lsp_references = { theme = "ivy" },
		lsp_code_actions = { theme = "cursor" },
		lsp_document_symbols = { theme = "ivy" },
		lsp_workspace_symbols = { theme = "ivy" },
		git_branches = { theme = "dropdown" },
	},
	extensions = {
		["ui-select"] = {
			themes.get_dropdown({}),
		},
	},
})

-- telescope.load_extension("env")
-- telescope.load_extension("luasnip")
-- telescope.load_extension("fzf")
-- telescope.load_extension("neoclip")
-- telescope.load_extension("macroscope")
-- telescope.load_extension("dap")
-- telescope.load_extension("ui-select")
