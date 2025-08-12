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
                ensure_installed = { "lua_ls", "gopls", "clangd", "jdtls", "csharp_ls", "bashls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
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
            lspconfig.csharp_ls.setup{}
            lspconfig.bashls.setup {}

            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics open float" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostics go to previous" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostics go to next" })
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics open location list" })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    vim.keymap.set("n", "<leader>f", vim.lsp.buf.hover, { buffer = ev.buf , desc = "LSP show hover" })
                    vim.keymap.set("i", "<C-f>", vim.lsp.buf.signature_help, { buffer = ev.buf , desc = "LSP signature help" })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf , desc = "LSP go to definition" })
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf , desc = "LSP go to references" })
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf , desc = "LSP rename" })
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf , desc = "LSP code action" })
					vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = ev.buf, desc = "LSP format"})
                end,
            })
        end,
    },
}
