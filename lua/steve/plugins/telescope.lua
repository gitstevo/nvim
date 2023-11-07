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
		-- For [file_browser] extension
		local fb = require("telescope").extensions.file_browser.actions

		telescope.setup({
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
				},
			},
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["<C-d>"] = actions.delete_buffer,
						-- For [file_browser] extension
						["<leader>f%"] = fb.create,
						["<leader>fD"] = fb.remove,
						["<leader>fR"] = fb.rename,
						["<leader>fM"] = fb.rename,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		-- set keymaps
		local set = vim.keymap.set -- for conciseness

		set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		set("n", "<leader>fg", builtin.live_grep, {})
		set("n", "<leader>fb", builtin.buffers, {})
		set("n", "<leader>fh", builtin.help_tags, {})
	end,
}
