--[[ return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			color_overrides = {
				all = {},
			},

			-- this one works
			custom_highlights = function(colors)
				return {
					-- --class names
					-- Type = { fg = "#9AFFFF" },
					-- --@ in @define
					-- Define = { fg = "#9AFFFF" },
					-- --define in @define
					-- Constant = { fg = "#9AFFFF" },
					-- --params
					-- ["@parameter"] = { fg = "#CDABEB" },
					-- -- class/extends/super/true
					-- ["@keyword"] = { fg = "#90b9d4" },
					-- -- text
					-- ["@string"] = { fg = "#C1EBC0" },
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
} ]]

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				disable_italics = true,
				highlight_groups = {
					ColorColumn = { bg = "rose" },
					Function = { fg = "#f2dfe5" },
					-- Type = { fg = "#f2dfe5" },
					-- String = { fg = "#d5f1b0" },
					String = { fg = "#f9d6aa" },
					--Keyword = { fg = "#5ea7c4" },

					-- Blend colours against the "base" background
					CursorLine = {},
					StatusLine = { fg = "love", bg = "love", blend = 10 },

					-- By default each group adds to the existing config.
					-- If you only want to set what is written in this config exactly,
					-- you can set the inherit option:
					Search = { bg = "gold", inherit = false },
				},
			})
			vim.cmd.colorscheme("rose-pine")
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = false,
				})
		end,
	},
}
