vim.g.mapleader = " "

local set = vim.keymap.set

--change insert mode --
set("i", "jj", "<ESC>", { desc = ":Exit insert mode with jj" })

--file tree --
set("n", "<leader>pv", vim.cmd.Ex)

--Go Back to Last File --
set("n", "<leader>fp", ":b#<CR>")

-- Toggle relative line number
set("n", "<leader>sl", ":set invrelativenumber<CR>", { desc = "Set relative numbers" })

-- Move visual mode selected lines up and down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

--Yank to system clipboard
set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set("n", "<leader>Y", '"+Y')

set("n", "Q", "<nop>")
