vim.g.mapleader = " " 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- movement between adjacent buffers
vim.keymap.set("n", "<C-j>", vim.cmd.bp)
vim.keymap.set("n", "<C-k>", vim.cmd.bn)
 
-- fast save
vim.keymap.set("n", "<leader> ", vim.cmd.w)

-- fast quit
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- move blocks of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- combine previous line
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- paste into system clipboad, from asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- packer sync
vim.keymap.set("n", "<leader>ss", vim.cmd.PackerSync)

-- navigation hacks to move around split buffers more effectively
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- emacs-like movement in insert mode
vim.keymap.set("i", "<M-b>", "<Esc>b")
vim.keymap.set("i", "<M-f>", "<Esc>f")
