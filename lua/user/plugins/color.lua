return {
	"sainnhe/gruvbox-material", -- colorschems
	lazy = false,
	priority = 100,
	config = function()
		vim.o.background = "dark"
		vim.g.gruvbox_material_background = "hard"

		vim.cmd([[colorscheme gruvbox-material]])
	end,
}
