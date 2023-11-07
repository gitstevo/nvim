vim.g.mapleader = " "

local set = vim.keymap.set -- for conciseness

--change insert mode --
set("i", "jj", "<Esc>", { desc = "Esc" })

--file tree--
set("n", "<leader>pv",vim.cmd.Ex)

-- Toggle relative line number--
set("n", "<leader>sl", ":set invrelativenumber<CR>", { desc = "Set relative numbers"})
