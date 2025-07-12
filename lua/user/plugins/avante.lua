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
			["bothub-claude-llama"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "llama-3.3-70b-instruct",
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
		windows = {
			---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
			---@type AvantePosition
			position = "left",
			fillchars = "eob: ",
			wrap = true, -- similar to vim.o.wrap
			width = 30, -- default % based on available width in vertical layout
			height = 30, -- default % based on available height in horizontal layout
			sidebar_header = {
				enabled = true, -- true, false to enable/disable the header
				align = "center", -- left, center, right for title
				rounded = true,
			},
			generating = { "·", "✢", "✳", "∗", "✻", "✽" },
			thinking = { "🤯", "🙄" },
			input = {
				prefix = "> ",
				height = 30, -- Height of the input window in vertical layout
			},
			edit = {
				border = { " ", " ", " ", " ", " ", " ", " ", " " },
				start_insert = false, -- Start insert mode when opening the edit window
			},
			ask = {
				floating = false, -- Open the 'AvanteAsk' prompt in a floating window
				border = { " ", " ", " ", " ", " ", " ", " ", " " },
				start_insert = true, -- Start insert mode when opening the ask window
				---@alias AvanteInitialDiff "ours" | "theirs"
				---@type AvanteInitialDiff
				focus_on_apply = "ours", -- which diff to focus after applying
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
