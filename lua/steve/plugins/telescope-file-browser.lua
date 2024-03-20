return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		vim.api.nvim_set_keymap(
			"n",
			"<C-p>",
			":Telescope file_browser path=%:p:h select_buffer=true<CR><Esc>",
			{ noremap = true }
		)
	end,
}
