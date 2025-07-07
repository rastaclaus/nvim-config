return {
	"supermaven-inc/supermaven-nvim",
	dependencies = {
		"huijiro/blink-cmp-supermaven",
	},

	config = function()
		require("supermaven-nvim").setup({
			disable_inline_completion = false,
			disable_keymap = false,
		})
	end,
}
