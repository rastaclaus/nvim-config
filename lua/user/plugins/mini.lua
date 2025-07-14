return {
	'echasnovski/mini.nvim',
	version = '*',
	config = function()
		require("mini.pairs").setup({
			event = 'InsertEnter',
			config = true,
		})
		require("mini.surround").setup()
		require("mini.snippets").setup()
		require("mini.comment").setup()
		-- require("mini.diff").setup()
	end,
}

