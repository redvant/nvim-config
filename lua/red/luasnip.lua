local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node

-- Example basic snippet
ls.add_snippets("lua", {
    s("hello", {
        t('print("hello world")')
    })
})

-- Add html snippets to gotmpl files
ls.filetype_extend("gotmpl", { "html" })
