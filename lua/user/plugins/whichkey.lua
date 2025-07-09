return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
			-- Debugger
			{
				"<leader>d",
				group = "Debugger",
				nowait = true,
				remap = false,
				desc = "Debug",
			},
			{
				"<leader>dt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
				nowait = true,
				remap = false,
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
				nowait = true,
				remap = false,
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
				nowait = true,
				remap = false,
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
				nowait = true,
				remap = false,
			},
			{
				"<leader>du",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
				nowait = true,
				remap = false,
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.open()
				end,
				desc = "Open REPL",
				nowait = true,
				remap = false,
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "Run Last",
				nowait = true,
				remap = false,
			},
			{
				"<leader>dq",
				function()
					require("dap").terminate()
					require("dapui").close()
					require("nvim-dap-virtual-text").toggle()
				end,
			},
		},
	},
}
