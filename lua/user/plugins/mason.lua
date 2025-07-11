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
	init = function(_)
		local pylsp = require("mason-registry").get_package("python-lsp-server")
		pylsp:on("install:success", function()
			local function mason_package_path(package)
				local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
				return path
			end

			local path = mason_package_path("python-lsp-server")
			local command = path .. "/venv/bin/pip"
			local args = {
				"install",
				"-U",
				"pylsp-mypy",
			}

			require("plenary.job")
				:new({
					command = command,
					args = args,
					cwd = path,
				})
				:start()
		end)
	end,
}
