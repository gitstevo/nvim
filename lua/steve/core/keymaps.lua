vim.g.mapleader = " "

local set = vim.keymap.set

--change enter key to save in normal mode
set("n", "<Enter>", "<cmd>update<CR>", { desc = "Save file on enter" })

--set line numbers/relative line numbers
set("n", "<leader>sl", ":set relativenumber!<CR>", { desc = "switch line/relative number" })

--rename with lsp and replace in all files
set("n", "<leader>gR", ":lsp vim.lsp.buf.rename()<CR>", { desc = "Rename in all files" })

--quit nvim
set("n", "<leader>Q", ":qa!<CR>", { desc = "force quit nvim" })

--clear highlighting after searching
set("n", "<leader>c/", ":nohlsearch<cr>", { desc = "Clear highlighting" })

--open git command
set("n", "<leader>git", ":Git ", { desc = "open :Git as a command to type" })

--file tree --
set("n", "<leader>pv", vim.cmd.Ex)

--Buffers
--Go to next buffer --
set("n", "<leader>bn", ":bn<CR>", { desc = "Go to next buffer in list" })
--Go Back to Last File --
set("n", "<leader>fp", "<cmd>b#<CR>", { desc = "Last Buffer" })

set("n", "<leader>/", ":%s@@<Left>", { desc = "Replace all instances of word in file" })

-- Move visual mode selected lines up and down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

--Yank to system clipboard
set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
set("n", "<leader>Y", '"+Y', { desc = "Yank to system clipboard" })

--window management --
set("n", "<c-l>", "<c-w>l", { desc = "Move to right window" })
set("n", "<c-h>", "<c-w>h", { desc = "Move to left window" })
set("n", "<c-k>", "<c-w>k", { desc = "Move to top window" })
set("n", "<c-j>", "<c-w>j", { desc = "Move to bottom window" })
set("n", "<c-q>", "<c-w>q", { desc = "Quit window" })
set("n", "<leader>wh", ":split<CR>", { desc = "Split window horizontally" })
set("n", "<leader>wv", ":vsplit<CR>", { desc = "Split window vertically" })
set("n", "<leader>gdv", function()
	vim.cmd("vsp")
	vim.cmd("Telescope lsp_definitions")
end, { desc = "Go to definition in vsplit" })
set("n", "<leader>gdh", function()
	vim.cmd("sp")
	vim.cmd("Telescope lsp_definitions")
end, { desc = "Go to definition in split" })
set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left window" })
set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom window" })
set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top window" })
set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right window" })

--terminal management
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal insert mode in terminal" })

--marks
--add file mark
set("n", "<leader>ma", "mA", { desc = "Mark buff A" })
set("n", "<leader>mb", "mB", { desc = "Mark buff B" })
set("n", "<leader>mc", "mC", { desc = "Mark buff C" })
set("n", "<leader>md", "mD", { desc = "Mark buff D" })
--delete file mark
set("n", "<leader>'a", "'A", { desc = "Go to marked buff A" })
set("n", "<leader>'b", "'B", { desc = "Go to marked buff B" })
set("n", "<leader>'c", "'C", { desc = "Go to marked buff C" })
set("n", "<leader>'d", "'D", { desc = "Go to marked buff D" })

--stupid
set("n", "<leader>qz", ":CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })
set("n", "<leader>qa", ":CellularAutomaton scramble<CR>", { desc = "Scramble" })
