return {
	"folke/which-key.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
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
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>m", group = "markdown", icon = "" },
			{ "<leader>d", group = "debug" },
			{ "<leader>dg", group = "debug go" },
			{ "<leader>c", group = "code actions" },
			{ "<leader>p", group = "search" },
			{ "<leader>n", group = "neovim config", icon = "" },
			{ "<leader>l", group = "log point", icon = "󰰍" },
			{ "<leader>g", group = "format" },
			{ "<leader>r", group = "rename", icon = "󰑕" },
		})
	end,
}
