-- Notes: check :nmap before adding!
-- e.g. :nmap <space>q to check what <leader>q does

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- mimic emacs delete word, I have this set on my keyboard
-- as a single button
vim.keymap.set("i", "<Esc><BS>", "<C-w>")

-- movement between adjacent buffers
vim.keymap.set("n", "<C-j>", vim.cmd.bp)
vim.keymap.set("n", "<C-k>", vim.cmd.bn)

-- fast save
vim.keymap.set("n", "<leader>w", ":w<cr>")

-- fast close buffer, preserving the window
vim.keymap.set("n", "<leader>bd", ":b#|bd#<cr>")

-- fast quit
vim.keymap.set("n", "<leader>q", ":q<cr>")

-- fast close window
vim.keymap.set("n", "<leader>x", "<C-w>q")

-- fast vertical split
vim.keymap.set("n", "<leader>l", ":vs<cr>")

-- move blocks of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- combine previous line
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- paste into system clipboad, from asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- quick access to lazy plugin config ('se') and lazy sync ('ss)
vim.keymap.set("n", "<leader>se", ":vs<CR>:e $HOME/.config/nvim/lua/vinceb/lazy.lua<CR>")
vim.keymap.set("n", "<leader>ss", ":Lazy sync<CR>")

-- quick access to remap edit ('re')
vim.keymap.set("n", "<leader>re", ":vs<CR>:e $HOME/.config/nvim/lua/vinceb/remap.lua<CR>")

-- quick access to the plugins config directory
vim.keymap.set("n", "<leader>pe", ":vs<CR>:e $HOME/.config/nvim/after/plugin/<CR>")

-- quick rerun init
vim.keymap.set("n", "<leader>pp", ":source $HOME/.config/nvim/init.lua<CR>")

-- navigation hacks to move around split buffers more effectively
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- emacs-like movement in insert mode
vim.keymap.set("i", "<M-b>", "<Esc>b")
vim.keymap.set("i", "<M-f>", "<Esc>f")

-- in terminal mode, leader-Esc gets us out
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")

-- work wrap magic (TODO still slow)
vim.keymap.set("n", "<leader><space>", "gwip")

-- stop hlsearch, until next time
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- Rust shortcut: C-d inserts debug, {:?}
vim.api.nvim_set_keymap('i', '<C-d>', '{:?}<Left><Left><Left>', { noremap = true, silent = true })

-- go to rust tests
vim.keymap.set("n", "<leader>gt", ":GoToRustTests<cr>")

-- add an unwrap at the end
vim.keymap.set("n", "<leader>n", ":AddUnwrapBeforeSemicolon<cr>")

-- cycle through my colors tryin' get that sweet look for the moment
vim.keymap.set("n", "<leader>c", ":CycleColorScheme<cr>", { silent = true })

-- open colors
vim.keymap.set("n", "<leader>ce", ":vs<CR>:e $HOME/.config/nvim/after/plugin/colors.lua<CR>")

-- format with Ruff (via conform)
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Format with Ruff (via conform)" })
