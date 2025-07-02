local format = function()
	local conform = require("conform")
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end

return {
	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "jq" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
				go = { "gofmt" },
				toml = { "pyproject-fmt" },
			},
			format_on_save = nil,
			-- format_on_save = nil{
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 500,
			-- },
		})
		conform.formatters.ruff_format = {
			prepend_args = { "--config", "~/.ruff.toml" },
		}
		conform.formatters.ruff_fix = {
			prepend_args = { "--config", "~/.ruff.toml" },
		}
		conform.formatters.ruff_organize_imports = {
			prepend_args = { "--config", "~/.ruff.toml" },
		}
		vim.keymap.set({ "v" }, "<leader>f", format, { desc = "Format range (in visual mode)" })
		vim.keymap.set({ "n" }, "<F5>", format, { desc = "Format file" })
	end,
}
