vim.g.mapleader = " "

local set = vim.keymap.set

--change enter key to save in normal mode
set("n", "<Enter>", "<cmd>update<CR>", { desc = "Save file on enter" })

--rename with lsp and replace in all files
set("n", "<leader>gR", ":lsp vim.lsp.buf.rename()<CR>", { desc = "Rename in all files" })

--define prefix keys --
set("n", "<leader>f", "<leader>f", { desc = "File + find commands" })
set("n", "<leader>g", "<leader>g", { desc = "Go to" })
set("n", "<leader>c", "<leader>c", { desc = "Code" })
set("n", "<leader>p", "<leader>p", { desc = "Path" })
set("n", "<leader>r", "<leader>r", { desc = "Rename or Restart" })
set("n", "<leader>s", "<leader>s", { desc = "Set" })
set("n", "<leader>w", "<leader>w", { desc = "Window Commands" })

--file tree --
set("n", "<leader>pv", vim.cmd.Ex)

--Go Back to Last File --
set("n", "<leader>fp", "<cmd>b#<CR>", { desc = "Last Buffer" })

-- Toggle relative line number
set("n", "<leader>sl", ":set invrelativenumber<CR>", { desc = "Set relative numbers" })

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
set("n", "<leader>wl", "<c-w>l", { desc = "Move to right window" })
set("n", "<leader>wh", "<c-w>h", { desc = "Move to left window" })
set("n", "<leader>wk", "<c-w>k", { desc = "Move to top window" })
set("n", "<leader>wj", "<c-w>j", { desc = "Move to bottom window" })
set("n", "<leader>wq", "<c-w>q", { desc = "Quit window" })
set("n", "<leader>wb", ":ball<CR>", { desc = "Window Ball command" })
set("n", "<leader>wsh", ":split<CR>", { desc = "Split window horizontally" })
set("n", "<leader>wsv", ":vsplit<CR>", { desc = "Split window vertically" })

--terminal management
set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal insert mode in terminal" })
