return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
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
	end,
}
