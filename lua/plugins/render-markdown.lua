return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
        local renderMarkdown = require('render-markdown')
        renderMarkdown.setup({
            bullet = { icons = { '', '', '◆', '◇', } },
        })
        vim.keymap.set("n", "<leader>mr", renderMarkdown.toggle, {})
    end,
}
