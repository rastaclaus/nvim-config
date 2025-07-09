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
vim.lsp.config("dmypy-ls", {
	cmd = { "dmypy-ls" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile" },
	init_options = {
		settings = {
			single_file_support = true,
		},
	},
})

vim.lsp.enable("dmypy-ls")
