-- tabs set to 4 width, not convert into spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false


-- Go shortcuts
vim.keymap.set("n", "<leader>gt", function()
    vim.cmd("!go test")
end)
vim.keymap.set("n", "<leader>gf", function()
    vim.cmd.write()
    local path = vim.api.nvim_buf_get_name(0)
    vim.cmd("!go fmt " .. path)
end)
