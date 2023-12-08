require("steve.core")
require("steve.lazy")
-- require("test.core")
-- require("test.lazy")
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	vim.api.nvim_set_hl(0, group, {})
end
