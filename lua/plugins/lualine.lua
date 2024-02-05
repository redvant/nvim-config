local colors = {
    fg = '#1c1c1c',
    bg = '#303030',
    green = '#98c379',
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'moonfly',
                component_separators = { left = '|', right = '|'},
                section_separators = { left = '', right = ''},
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {},
                lualine_x = {{
                    'buffers',
                    mode = 4, 
                    max_length = vim.o.columns * 0.85,
                    buffers_color = { active = {fg = colors.fg, bg = colors.green} },
                }},
                lualine_y = {},
                lualine_z = {'location'}
            },
        })
    end
}
