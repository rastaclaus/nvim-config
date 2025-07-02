return {
	"supermaven-inc/supermaven-nvim",
    dependencies = {
        "huijiro/blink-cmp-supermaven",
    },

	config = function()
		require("supermaven-nvim").setup({
            disable_inline_completion = true,
            disable_keymap =true,


        })
	end,
}
