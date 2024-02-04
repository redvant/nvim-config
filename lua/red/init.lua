require("red.remap")
require("red.set")
require("red.lazy")

-- Habamax
--vim.cmd([[
--colorscheme habamax
--hi MatchParen guibg=darkcyan guifg=#1C1C1C
--]])

-- hi MatchParen guibg=#5F8787 guifg=#1C1C1C

-- Meant to make bg transparent, not working
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
