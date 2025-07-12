return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = function()
		-- conditionally use the correct build system for the current OS
		return "BUILD_FROM_SOURCE=true make"
	end,
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		provider = "bothub-gemini",
		cursor_applying_provider = "bothub-qwen",
		behaviour = {
			enable_cursor_planning_module = true,
		},
		providers = {
			["bothub-claude-haiku"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "claude-3.5-haiku",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-deepseek"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "deepseek-r1",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-qwen"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "qwen-2.5-coder-32b-instruct",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-gemini"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "gemini-2.5-flash",
				api_key_name = "BOTHUB_API_KEY",
			},
		},
		{
			input = {
				provider = "snacks",
				provider_opts = {
					-- Additional snacks.input options
					title = "Avante Input",
					icon = " ",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
