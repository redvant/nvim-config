return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {},
				},
			})
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope git files" })
			vim.keymap.set("n", "<leader>pt", builtin.git_status, { desc = "Telescope git status" })
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Telescope grep files content" })
			vim.keymap.set("n", "<leader>pk", function()
				builtin.keymaps({ show_plug = false })
			end, { desc = "Telescope keymaps" })
			vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Telescope help tags" })

			vim.keymap.set("n", "<leader>nc", function()
				builtin.find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "Neovim config files (Telescope)" })

			vim.keymap.set("n", "<leader>nf", function()
				builtin.find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end, { desc = "Neovim lazy files (Telescope)" })

			require("config.telescope.multigrep").setup()
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
