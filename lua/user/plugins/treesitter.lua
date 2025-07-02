return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"python",
					"go",
					"markdown",
					"json",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-n>",
						node_incremental = "<C-n>",
						scope_incremental = "<C-s>",
						node_decremental = "<C-m>",
					},
				},
				indent = { enable = false },
			})
		end,
	},
}
