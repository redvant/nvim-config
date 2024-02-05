-- tabs set to 4 width, not convert into spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false


-- Go shortcuts
vim.keymap.set("n", "<leader>gt", function()
    vim.cmd("!go test")
end)

-- Replaced for BufWritePre and none-ls keymap
--[[
vim.keymap.set("n", "<leader>gf", function()
    vim.cmd.write()
    local path = vim.api.nvim_buf_get_name(0)
    vim.cmd("!go fmt " .. path)
end)
]]--

-- On Save format with gopls and OrganizeImports(add and organize)
vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspGo', {}),
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = {only = {"source.organizeImports"}}
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format()
    end,
})
