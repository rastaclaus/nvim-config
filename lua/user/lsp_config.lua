local lspconfig = require("lspconfig")

vim.lsp.config("ruff", {
	init_options = {
		settings = {
			configuration = os.getenv("HOME") .. "/.ruff.toml",
			configurationPreference = "filesystemFirst",
		},
	},
})

vim.lsp.config("ty", {
	init_options = {
		settings = {
			disableLanguageServices = false,
		},
	},
})
vim.lsp.config("gopls", {
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
})
