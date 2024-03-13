return {
	-- "catppuccin/nvim",
	-- name = "catppuccin",
	-- priority = 1000,
	-- config = function()
	-- 	require("catppuccin").setup({
	-- 		-- flavour = "Macchiato",
	-- 		-- flavour = "mocha",
	-- 		flavour = "Frappe",
	-- 		-- flavour = "Latte",
	-- 	})
	-- 	vim.cmd.colorscheme("catppuccin")
	-- end,
	-- --
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				enable = {
					terminal = true,
				},
			})
			vim.cmd.colorscheme("rose-pine")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
