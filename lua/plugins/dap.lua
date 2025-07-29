return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "leoluz/nvim-dap-go",
            'nicholasmata/nvim-dap-cs',
        },
        config = function()
            local dap = require("dap")
            local dapgo = require("dap-go")
            dapgo.setup()
            require("dap-cs").setup()

            vim.keymap.set("n", "<F7>", dap.continue, { desc = "Dap continue" })
            vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Dap step over" })
            vim.keymap.set("n", "<F9>", dap.step_into, { desc = "Dap step into" })
            vim.keymap.set("n", "<F10>", dap.step_out, { desc = "Dap step out" })
            vim.keymap.set("n", "<F12>", dap.restart, { desc = "Dap restart" })
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Dap toggle breakpoint" })
            vim.keymap.set("n", "<leader>lp", function()
                dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
            end, { desc = "Dap set log point" })
            vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Dap toggle REPL" })
            vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Dap run last" })
            vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Dap run to cursor" })
            vim.keymap.set("n", "<leader>db", function() dap.list_breakpoints(true) end, { desc = "Dap list breakpoints" })

            vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
                require("dap.ui.widgets").hover()
            end, { desc = "Dap hover value" })
            vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
                require("dap.ui.widgets").preview()
            end, { desc = "Dap preview value" })
            vim.keymap.set("n", "<Leader>df", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end, { desc = "Dap show frames" })
            vim.keymap.set("n", "<Leader>ds", function()
                local widgets = require("dap.ui.widgets")
                local columns = vim.o.columns
                local width = math.floor(columns * 0.2)
                widgets.sidebar(widgets.scopes,{width = width}).open()
            end, { desc = "Dap show scopes" })

            vim.keymap.set("n", "<leader>dgt", dapgo.debug_test, { desc = "Dap-go run test" })
            vim.keymap.set("n", "<leader>dgl", dapgo.debug_last_test, { desc = "Dap-go run last test" })
        end,
    },
}
