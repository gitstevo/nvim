return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local function hello()
			return ""
		end
		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
				icons_enabled = true,
			},
			sections = {
				lualine_a = {
					{
						hello,
						on_click = function()
							vim.fn.system('open "https://github.com/auralabs"')
						end,
					},
				},
				lualine_b = {
					{
						"branch",
						on_click = function()
							local repo = string.sub(vim.trim(vim.fn.system("git remote get-url origin")), 0, -5)
								.. "/tree/"
							local branch = vim.trim(vim.fn.system("git branch --show-current"))
							local path = repo .. branch
							local command = string.format("open %s", path)
							vim.fn.system(command)
						end,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 4,
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
