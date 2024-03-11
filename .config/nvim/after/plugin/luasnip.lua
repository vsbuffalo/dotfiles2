
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

-- ls.add_snippets("rust", {
--     s("mdt", { 
--         t("#[cfg(test)]"), 
--         t({"", "mod tests {", "    "}),  i(1),  t({"", "}"})
--     })
-- })


-- Adding Rust-specific snippet
ls.add_snippets("rust", {
    -- mdt: create a test mod
    s("mdt", { 
        t("#[cfg(test)]"), 
        t({"", "mod tests {", "    "}),  i(1),  t({"", "}"})
    }),
    -- impl Debug
    s("impldebug", fmt([[
impl std::fmt::Debug for {} {{
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {{
        f.debug_struct("{}")
         {} // Placeholder for debug fields
         .finish()
    }}
}}
    ]], {
        i(1, "StructName"), -- Placeholder 1: Struct name
        i(2, "StructName"), -- Placeholder 2: Struct name repeated for debug_struct
        i(3, ".field(\"name\", &self.name)") -- Placeholder 3: Example field, adjust as needed
    })),
}, {key = "rust"})

