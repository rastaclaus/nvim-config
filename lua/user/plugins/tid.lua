return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				show_source = true,
				set_arrow_to_diag_color = false,
				add_messages = true,
				show_all_diags_on_cursor_line = true,

				format = function(diagnostic)
					local message = diagnostic.message
					if diagnostic.code then
						message = message .. " " .. diagnostic.code
					end
					if diagnostic.source then
						message = diagnostic.source .. " " .. message
					end
					return message
				end,
			},
		})
		vim.diagnostic.config({ virtual_text = false })
	end,
}
