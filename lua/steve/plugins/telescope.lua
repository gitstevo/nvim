return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			-- For TeleScope File Browser to use
			extensions = {
				file_browser = {
					hijack_netrw = true,
				},
			},
			pickers = {
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end,
				},
			},
			defaults = {

				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						-- ["<C-a>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["<leader>d"] = actions.delete_buffer,
					},
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		-- set keymaps
		local set = vim.keymap.set -- for conciseness

		set("n", "<C-f>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		set(
			"n",
			"<leader><C-f>",
			"<cmd>Telescope find_files hidden=true<cr>",
			{ desc = "Fuzzy find hidden files in cwd" }
		)
		set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
		set("n", "<leader>fb", ":Telescope buffers<CR><Esc>", { desc = "Find Buffers" })
		set("n", "<leader>fhl", ":Telescope help_tags<CR>", { desc = "Find Help" })
		set("n", "<leader>p", ":Telescope diagnostics<CR>", { desc = "Show diagnostics for project" })
	end,
}
