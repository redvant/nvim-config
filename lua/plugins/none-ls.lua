return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.formatting.markdownlint, -- The prettier format is enough to fix most linter errors
                null_ls.builtins.diagnostics.markdownlint,
            },
            -- Keymap already present in lsp-config
            -- on_attach = function(client)
            -- 	if client.supports_method("textDocument/formatting") then
            -- 		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
            -- 	end
            -- end,
        })
    end,
}
