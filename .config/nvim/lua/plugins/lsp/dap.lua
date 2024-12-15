-- https://github.com/mfussenegger/nvim-dap
-- Debug Adapter Protocol
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
      "nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

      require("dapui").setup()
      require("dap-python").setup("python")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
