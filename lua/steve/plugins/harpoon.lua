return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local set = vim.keymap.set
		set("n", "<leader>a", mark.add_file)
		set("n", "<leader>hs", ui.toggle_quick_menu)
		set("n", "<leader>d", mark.rm_file)
		set("n", "<leader>cl", mark.clear_all)
	end,
}
