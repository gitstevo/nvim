return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						on_click = function()
							os.execute('open "https://github.com/auralabs"')
						end,
					},
				},
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 2,
						color = {
							bg = "#303446",
							on_click = function()
								local localpath = vim.fn.expand("%")
								-- vim.cmd("echo '" .. localpath .. "'")
								vim.cmd("finddir('.git/..', expand('%').';')")
								-- local path = vim.cmd("finddir('.git/..', expand('%').';')")
								-- vim.cmd.finddir(".git/..", 'vim.cmd.expand("%").";")
								-- vim.fn.setreg("+", localpath)
							end,
						},
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64", bg = "#303446" },
					},
				},
				lualine_y = { { color = { bg = "#303446" } } },
				lualine_z = { { color = { bg = "#303446" } } },
			},
			inactive_sections = {
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 2 } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
