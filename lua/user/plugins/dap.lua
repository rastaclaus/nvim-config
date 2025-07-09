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
			ensure_installed = { "python" },
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
		dap.adapters.python = {
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}", -- текущий открытый файл
				pythonPath = function()
					return "/usr/bin/python" -- или путь к нужному Python (можно удалить, если используешь venv)
				end,
			},
			{
				type = "python",
				request = "attach",
				name = "Attach to process",
				host = "localhost",
				port = 5678,
			},
		}
	end,
}
