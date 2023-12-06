local opt = vim.opt
---------------- vim options  ----------------
opt.number = true -- shows line numbers

opt.tabstop = 4 -- for tab spacing
opt.shiftwidth = 4 -- for tab spacing
opt.hidden = true
opt.scrolloff = 8 -- scrolls when you are 8 lines from the top or bottom of the page
-- opt.signcolumn = "yes"

opt.termguicolors = true

-- make cursor thick and blink in insert mode
opt.guicursor = {
	"n-v-c:block",
	"i-ci:block-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100",
}
--relative numbers instead of line numbers
opt.relativenumber = true

vim.api.nvim_set_option("clipboard", "unnamedplus")
