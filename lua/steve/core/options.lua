local opt = vim.opt
---------------- vim options  ----------------
opt.number = true -- shows line numbers
opt.tabstop = 4
opt.shiftwidth = 4
opt.hidden = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.termguicolors = true

opt.relativenumber = true

vim.api.nvim_set_option("clipboard", "unnamedplus")
