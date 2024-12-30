vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-i>", "<cmd>silent !tmux neww cht.sh<CR>")

-- cicle quickfix list
vim.keymap.set("n", "<C-j>", vim.cmd.cnext)
vim.keymap.set("n", "<C-k>", vim.cmd.cprev)

-- replace selected with latest register, and send text to replace to nul register
vim.keymap.set("v", "<leader>p", '"_dp')
-- yank selected to system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
-- yank entire file to system clipboard
vim.keymap.set("n", "<leader>Y", 'gg"+yG')

-- move selection up or down a line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("v", "J", function()
--     vim.cmd.move("'>+1")
--     vim.api.nvim_input("gv=gv")
-- end)
