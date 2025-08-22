return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls", "clangd", "jdtls", "csharp_ls", "bashls", "pylsp" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("lua_ls", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using (most
							-- likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
							-- Tell the language server how to find Lua modules same way as Neovim
							-- (see `:h lua-module-load`)
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Depending on the usage, you might want to add additional paths
								-- here.
								-- '${3rd}/luv/library'
								-- '${3rd}/busted/library'
							},
							-- Or pull in all of 'runtimepath'.
							-- NOTE: this is a lot slower and will cause issues when working on
							-- your own configuration.
							-- See https://github.com/neovim/nvim-lspconfig/issues/3189
							-- library = {
							--   vim.api.nvim_get_runtime_file('', true),
							-- }
						},
					})
				end,
				settings = {
					Lua = {},
				},
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})
			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					-- "--header-insertion=iwyu",
					-- "--completion-style=detailed",
					-- "--log=verbose",
				},
				init_options = {
					-- completeUnimported = true,
				},
			})
			vim.lsp.enable("csharp_ls")
			vim.lsp.enable("bashls")
			vim.lsp.enable("pyslp")

			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics open float" })

			vim.keymap.set("n", "<leader>h", function ()
			    vim.diagnostic.hide(nil, 0)
			end, { desc = "Diagnostics hide in current buffer" })

			vim.keymap.set("n", "<leader>H", function ()
			    vim.diagnostic.show(nil, 0)
			end, { desc = "Diagnostics show in current buffer" })

			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = 1 })
			end, { desc = "Diagnostics go to previous" })

			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = -1 })
			end, { desc = "Diagnostics go to next" })

			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics open location list" })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set("n", "<leader>f", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP show hover" })
					vim.keymap.set(
						"i",
						"<C-f>",
						vim.lsp.buf.signature_help,
						{ buffer = ev.buf, desc = "LSP signature help" }
					)
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ buffer = ev.buf, desc = "LSP go to definition" }
					)
					vim.keymap.set(
						"n",
						"gr",
						vim.lsp.buf.references,
						{ buffer = ev.buf, desc = "LSP go to references" }
					)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP rename" })
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = ev.buf, desc = "LSP code action" }
					)
					vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = ev.buf, desc = "LSP format" })
				end,
			})
		end,
	},
}
