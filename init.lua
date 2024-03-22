vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

require("steve.core")
require("steve.lazy")
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	vim.api.nvim_set_hl(0, group, {})
end
