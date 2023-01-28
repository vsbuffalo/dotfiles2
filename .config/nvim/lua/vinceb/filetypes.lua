-- tell nvim to treat Snakefiles as python 
-- this is approximate, could be fixed later with a paper LSP
vim.cmd.au("BufNewFile,BufRead Snakefile set syntax=python")
vim.cmd.au("BufNewFile,BufRead *.snake set syntax=python")
