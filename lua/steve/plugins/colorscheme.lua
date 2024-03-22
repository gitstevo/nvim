return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "Frappe",
			})
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
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
			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"morhetz/gruvbox",
		name = "gruvbox",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({
				-- ...
			})

			-- vim.cmd("colorscheme github_dark")
		end,
	},
}
