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
