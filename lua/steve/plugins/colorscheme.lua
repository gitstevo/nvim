return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- flavour = "Macchiato",
			-- flavour = "Mocha",
			flavour = "Frappe",
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
	-- "rose-pine/neovim",
	-- priority = 1000,
	-- config = function()
	-- 	require("rose-pine").setup({
	-- 		variant = "moon",
	-- 	})
	-- 	vim.cmd.colorscheme("rose-pine")
	-- end,
}
