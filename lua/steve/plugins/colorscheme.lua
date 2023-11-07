return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	color_overrides = {
		mocha = {
			text = "#CE00FC",
			subtext1 = "#CE00FC",
			subtext0 = "#CE00FC",
			overlay2 = "#DEBAD4",
			overlay1 = "#9C7F92",
			overlay0 = "#866C7D",
			surface2 = "#CE00FC",
			surface1 = "#5A4551",
			surface0 = "#44313B",

			base = "#352939",
			mantle = "#211924",
			crust = "#1a1016",
		},
	},
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", ------------------"macchiato",
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
			color_overrides = {
				macchiato = { Yellow = "#3b6594" },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,

	--[[ "ramojus/mellifluous.nvim",
	name = "mellifluous",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("mellifluous")
	end, ]]
}
