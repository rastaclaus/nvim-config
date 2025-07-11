local lspconfig = require("lspconfig")

vim.lsp.config("ruff", {
	init_options = {
		settings = {
			configuration = os.getenv("HOME") .. "/.ruff.toml",
			configurationPreference = "filesystemFirst",
		},
	},
})
vim.lsp.config("pylsp", {
	init_options = {
		pylsp = {
			plugins = {
				pycodestyle = {
					maxLineLength = 120,
					ignore = {"E701"}
				},
				pylsp_mypy = {
					dmypy = true,
					overrides = { "--python-executable", vim.fn.system("which python"):gsub("\n$", ""), true },
				},
			},
		},
	},
})
vim.lsp.config("ty", {
	init_options = {
		settings = {
			disableLanguageServices = true,
		},
	},
})
vim.lsp.config("gopls", {
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
})
