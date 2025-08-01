return {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
        { "nvim-telescope/telescope.nvim" }, -- optional
        { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "go" } } },
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest",
    cmd = { "GoDoc" },
    opts = {
        picker = {
            type = "telescope",
        },
    },
    keys = {
        {
            "<leader>gd",
            vim.cmd.GoDoc,
            desc = "Go search docs (Telescope)",
        },
    },
}
