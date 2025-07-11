return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-dap-ui",
		"nvim-dap-virtual-text",
		"nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {},
			automatic_setup = true,
		})

		require("nvim-dap-virtual-text").setup()

		local dap = require("dap")
		local dapui = require("dapui")

		-- Инициализация интерфейса
		dapui.setup()

		-- Открытие UI при старте сессии
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		-- Закрытие UI при остановке сессии
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		-- Конфигурация для Python
		dap.adapters.python = function(cb, config)
			if config.request == "attach" then
				---@diagnostic disable-next-line: undefined-field
				local port = (config.connect or config).port
				---@diagnostic disable-next-line: undefined-field
				local host = (config.connect or config).host or "127.0.0.1"
				cb({
					type = "server",
					port = assert(port, "`connect.port` is required for a python `attach` configuration"),
					host = host,
					options = {
						source_filetype = "python",
					},
				})
			else
				cb({
					type = "executable",
					command = ("debugpy-adapter"),
					options = {
						source_filetype = "python",
					},
				})
			end
		end

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}", -- текущий открытый файл
			},
			{
				type = "python",
				request = "attach",
				connect = {
					port = 5678,
				},
				mode = "remote",
				name = "Attach to process localhost:5678",
				cwd = vim.fn.getcwd(),
				pathMappings = {
					{
						localRoot = vim.fn.getcwd() .. "/src", -- Wherever your Python code lives locally.
						remoteRoot = vim.fn.getcwd() .. "/src", -- Wherever your Python code lives in the container.
					},
				},
			},
		}
	end,
}
