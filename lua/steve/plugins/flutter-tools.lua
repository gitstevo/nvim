return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	ft = "dart",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		local opts = { noremap = true, silent = true }
		local set = vim.keymap.set
		require("flutter-tools").setup({
			closing_tags = {
				enabled = false,
			},
			dev_tools = {
				autostart = true,
			},
			root_patterns = { ".git", "pubspec.yaml" },
			lsp = {
				color = {
					enabled = true,
				},
				settings = {
					enableSnippets = true,
					renameFilesWithClasses = "always",
					analysisExcludedFolders = {
						".dart_tool",
					},
					completeFunctionCalls = true,
					experimentalRefactors = true,
				},

				on_attach = function(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil

					opts.buffer = bufnr

					opts.desc = "Show Flutter Commands in Telescope"
					set("n", "<leader>fl", "<cmd>Telescope flutter commands<CR>", opts) -- show definition, references

					opts.desc = "Show LSP references"
					set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

					opts.desc = "Go to declaration"
					set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

					opts.desc = "Show LSP definitions"
					set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

					opts.desc = "Show LSP implementations"
					set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

					opts.desc = "Show LSP type definitions"
					set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

					opts.desc = "See available code actions"
					set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

					opts.desc = "Smart rename"
					set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

					opts.desc = "Show buffer diagnostics"
					set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

					opts.desc = "Show line diagnostics"
					set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

					opts.desc = "Go to previous diagnostic"
					set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

					opts.desc = "Go to next diagnostic"
					set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

					opts.desc = "Show documentation for what is under cursor"
					set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

					opts.desc = "Restart LSP"
					set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				end,
			},
		})
	end,
}
