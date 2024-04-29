require("dapui").setup({
	layouts = {
		elements = {
			"scopes",
			"breakpoints",
			"stacks",
			"watches",
		},
		size = 40,
		position = "right",
	},
	{
		elements = {
			"repl",
			"console",
		},
		size = 10,
		position = "bottom",
	},
})
