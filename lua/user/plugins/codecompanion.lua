return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = function()
		return {
			adapters = {
				opts = {
					show_defaults = false,
					show_model_choices = true,
				},
				["bothub"] = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "bothub",
						formatted_name = "BotHub",
						env = {
							url = "https://bothub.chat/api/v2/openai",
							api_key = "cmd: cat ~/.config/openai_key",
							chat_url = "/v1/chat/completions",
							models_endpoint = "/v1/models",
						},
						schema = {
							model = {
								default = "gemini-2.5-flash", -- define llm model to be used
							},
							temperature = {
								order = 2,
								mapping = "parameters",
								type = "number",
								optional = true,
								default = 0.0,
								desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
								validate = function(n)
									return n >= 0 and n <= 2, "Must be between 0 and 2"
								end,
							},
						},
					})
				end,
				["ntech"] = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "ntech",
						formatted_name = "NTech",
						env = {
							url = "http://p2.msk-1.hpc-park.ru:36503",
							api_key = "cmd: cat ~/.config/ntech_key",
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "Qwen/Qwen3-32B", -- define llm model to be used
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "bothub",
				},
				inline = {
					adapter = "bothub",
				},
			},
			opts = {
				log_level = "INFO",
			},
			display = {
				diff = {
					enabled = true,
					close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "mini_diff", -- default|mini_diff
				},
				chat = {
					show_settings = true,
				},
			},
			---@module "vectorcode"
			extensions = {
				vectorcode = {
					---@type VectorCode.CodeCompanion.ExtensionOpts
					opts = {
						tool_group = {
							-- this will register a tool group called `@vectorcode_toolbox` that contains all 3 tools
							enabled = true,
							-- a list of extra tools that you want to include in `@vectorcode_toolbox`.
							-- if you use @vectorcode_vectorise, it'll be very handy to include
							-- `file_search` here.
							extras = {},
							collapse = false, -- whether the individual tools should be shown in the chat
						},
						tool_opts = {
							---@type VectorCode.CodeCompanion.LsToolOpts
							ls = {},
							---@type VectorCode.CodeCompanion.VectoriseToolOpts
							vectorise = {},
							---@type VectorCode.CodeCompanion.QueryToolOpts
							query = {
								max_num = { chunk = -1, document = -1 },
								default_num = { chunk = 50, document = 10 },
								include_stderr = false,
								use_lsp = true,
								no_duplicate = true,
								chunk_mode = false,
								---@type VectorCode.CodeCompanion.SummariseOpts
								summarise = {
									---@type boolean|(fun(chat: CodeCompanion.Chat, results: VectorCode.QueryResult[]):boolean)|nil
									enabled = false,
									adapter = nil,
									query_augmented = true,
								},
							},
							files_ls = {},
							files_rm = {},
						},
					},
				},
			},
		}
	end,
}
