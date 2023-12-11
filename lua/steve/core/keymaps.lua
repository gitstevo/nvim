vim.g.mapleader = " "

local set = vim.keymap.set

--change enter key to save in normal mode
set("n", "<Enter>", "<cmd>update<CR>", { desc = "Save file on enter" })

--rename with lsp and replace in all files
set("n", "<leader>gR", ":lsp vim.lsp.buf.rename()<CR>", { desc = "Rename in all files" })

--clear highlighting after searching
set("n", "<leader>c/", ":nohlsearch<cr>", { desc = "Clear highlighting" })

--define prefix keys --
set("n", "<leader>f", "<leader>f", { desc = "File + find commands" })
set("n", "<leader>g", "<leader>g", { desc = "Go to" })
set("n", "<leader>p", "<leader>p", { desc = "Path" })
set("n", "<leader>r", "<leader>r", { desc = "Rename or Restart" })
set("n", "<leader>w", "<leader>w", { desc = "Window Commands" })

--open git command
set("n", "<leader>git", ":Git ", { desc = "open :Git as a command to type" })

--file tree --
set("n", "<leader>pv", vim.cmd.Ex)

--Buffers
--Go to next buffer --
set("n", "<leader>bn", ":bn<CR>", { desc = "Go to next buffer in list" })
--Go to previous buffer --
set("n", "<leader>bp", ":bn<CR>", { desc = "Go to previous buffer in list" })
--Go Back to Last File --
set("n", "<leader>fp", "<cmd>b#<CR>", { desc = "Last Buffer" })

-- Move visual mode selected lines up and down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

--Yank to system clipboard
set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
set("n", "<leader>Y", '"+Y', { desc = "Yank to system clipboard" })

--never hit q and quit
set("n", "Q", "<nop>")

--window management --
set("n", "<c-l>", "<c-w>l", { desc = "Move to right window" })
set("n", "<c-h>", "<c-w>h", { desc = "Move to left window" })
set("n", "<c-k>", "<c-w>k", { desc = "Move to top window" })
set("n", "<c-j>", "<c-w>j", { desc = "Move to bottom window" })
set("n", "<c-q>", "<c-w>q", { desc = "Quit window" })
set("n", "<leader>wh", ":split<CR>", { desc = "Split window horizontally" })
set("n", "<leader>wv", ":vsplit<CR>", { desc = "Split window vertically" })

--terminal management
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal insert mode in terminal" })
