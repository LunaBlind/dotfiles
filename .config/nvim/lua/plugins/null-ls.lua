local lspconfig = require("plugins.lsp-setup")
local null_ls = require("null-ls")
local fmt = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics
local act = null_ls.builtins.code_actions

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
	-- python --
	fmt.black,
	fmt.isort,
	diag.mypy,
	diag.flake8.with({ args = {
		"--max-line-length",
		"119",
		"--stdin-display-name",
		"$FILENAME",
		"-",
	} }),
	-- diag.pydocstyle,

	-- -- web-dev --
	-- fmt.prettier, -- js/ts/css/scss/html/json/md/
	-- fmt.stylelint, -- scss/less/css/sass
	-- diag.stylelint, -- scss/less/css/sass
    -- fmt.eslint_d, -- js/ts
    -- diag.eslint_d, -- js/ts
    -- act.eslint_d, -- js/ts

	-- fmt.rustfmt.with({ extra_args = { "--edition=2021" } }), -- rust
	fmt.stylua, -- lua
	fmt.cmake_format, -- cmake
	fmt.clang_format, -- C/C++/...
	fmt.fourmolu, -- haskell
    fmt.xmllint, -- XML
}

null_ls.setup({
	sources = sources,
	on_attach = lspconfig.on_attach,
})
