return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			keys = {
				-- "<leader>du",
				-- function()
				-- 	require("dapui").toggle({})
				-- end,
				-- desc = "dap-ui",
			},
			opts = {
				controls = {
					enabled = false,
				},
			},
			config = function(_, opts)
				local dapui = require("dapui")
				local dap = require("dap")
				dapui.setup(opts or {})
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = {
				"williamboman/mason.nvim",
				"mfussenegger/nvim-dap",
			},
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					"coreclr",
				},
			},
		},
	},
	config = function()
		local dap = require("dap")
		dap.set_log_level("TRACE")
	end,
}
