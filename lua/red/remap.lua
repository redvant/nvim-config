vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw on current file directory" })

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<C-i>", "<cmd>silent !tmux neww cht.sh<CR>")

-- cicle quickfix list
vim.keymap.set("n", "<C-j>", vim.cmd.cnext, { desc = "Next item in quickfix" })
vim.keymap.set("n", "<C-k>", vim.cmd.cprev, { desc = "Previous item in quickfix" })
-- cicle location list
vim.keymap.set("n", "<C-S-j>", vim.cmd.lnext, { desc = "Next item in location list" })
vim.keymap.set("n", "<C-S-k>", vim.cmd.lprev, { desc = "Previous item in location list" })

-- replace selected with latest register, and send text to replace to nul register
vim.keymap.set("v", "<leader>p", '"_dp', { desc = "Replace selected with latest register, send to null register" })
-- yank selected to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selected to system clipboard" })
-- vim.keymap.set("n", "<leader>y", '"+y')
-- yank entire file to system clipboard
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { desc = "Yank entire file to system clipboard" })

-- move selection up or down a line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down a line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up a line" })

-- vim.keymap.set("v", "J", function()
--     vim.cmd.move("'>+1")
--     vim.api.nvim_input("gv=gv")
-- end)
