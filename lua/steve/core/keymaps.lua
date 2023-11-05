vim.g.mapleader = " "
local set = vim.keymap.set -- for conciseness
set("n", "<leader>pv",vim.cmd.Ex)
set("i", "jj", "<Esc>", { desc = "Esc" })

