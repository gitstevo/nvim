local opt = vim.opt
---------------- vim options  ----------------
opt.swapfile = false -- no swap files

opt.number = true -- shows line numbers

opt.tabstop = 4 -- for tab spacing

opt.shiftwidth = 4 -- for tab spacing

opt.hidden = true

opt.scrolloff = 8 -- scrolls when you are 8 lines from the top or bottom of the page

opt.signcolumn = "yes"

--splitting directions
opt.splitbelow = true
opt.splitright = true

-- colors from terminal
opt.termguicolors = true

-- search options with asterisk
opt.incsearch = true

vim.opt.updatetime = 50

-- make cursor thick and blink in insert mode
opt.guicursor = {
	"n-v-c:block",
	"i-ci:block-Cursor/lCursor-blinkwait500-blinkon100-blinkoff100",
}
--relative numbers instead of line numbers
opt.relativenumber = true

vim.api.nvim_set_option("clipboard", "unnamedplus")
