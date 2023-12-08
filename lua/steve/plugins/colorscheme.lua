return {
	--
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- flavour = "Macchiato",
			flavour = "Mocha",
			-- flavour = "Frappe",
			-- flavour = "Latte",
		})
		vim.cmd.colorscheme("catppuccin")
	end,
	--
	-- "rebelot/kanagawa.nvim",
	-- name = "kanagawa",
	-- priority = 1000,
	-- config = function()
	-- 	require("kanagawa").setup({})
	-- 	vim.cmd.colorscheme("kanagawa")
	-- 	-- vim.cmd.colorscheme("kanagawa-lotus")
	-- end,
	-- "neanias/everforest-nvim",
	-- priority = 1000,
	-- config = function()
	-- 	require("everforest").setup({
	-- 		background = "soft",
	-- 	})
	-- 	vim.cmd.colorscheme("everforest")
	-- end,
}
