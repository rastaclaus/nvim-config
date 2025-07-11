return {
	"OscarCreator/rsync.nvim",
	build = "make",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		--- @type RsyncConfig
		require("rsync").setup({
			sync_on_save=false

		})
	end,
}
