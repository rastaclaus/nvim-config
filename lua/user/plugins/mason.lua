return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
        local lspconfig = require("lspconfig")
		require("mason").setup()
		require("mason-lspconfig").setup({})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"ruff",
				"stylua",
				"json-lsp",
				"jq",
				"yaml-language-server",
				"yamlfix",
				"gopls",
			},
		})
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
                }
            }
        })
		vim.lsp.config("gopls", {
			root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
		})
	end,
}
