return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	ft = "dart",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup_project({
			{
				name = "Profile",
				flutter_mode = "profile", -- possible values: `debug`, `profile` or `release`, defaults to `debug`
			},
			{
				name = "Release",
				flutter_mode = "release", -- possible values: `debug`, `profile` or `release`, defaults to `debug`
			},
			{
				name = "Debug",
			},
		})
		local opts = { noremap = true, silent = true }
		local set = vim.keymap.set
		require("flutter-tools").setup({
			debugger = { -- integrate with nvim dap
				enabled = true,
				exceptionbreakpoints = {},
				registerconfigurations = function(paths) end,
			},
			fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
			closing_tags = {
				enabled = false,
			},
			dev_tools = {
				autostart = true,
			},
			dev_log = {
				open_cmd = "sp",
			},
			root_patterns = { ".git", "pubspec.yaml" },
			lsp = {
				color = {
					enabled = true,
				},
				settings = {
					enableSnippets = true,
					renameFilesWithClasses = "prompt",
					analysisExcludedFolders = {
						vim.fn.expand("~") .. "/.pub-cache/",
					},
					completeFunctionCalls = true,
					experimentalRefactors = true,
				},

				on_attach = function(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil

					opts.buffer = bufnr

					-- flutter-tools mappings
					set("n", "<leader>Fc", "<cmd>Telescope flutter commands<CR>", opts) -- show definition, references
					set("n", "<leader>Fr", "<cmd>FlutterRun<CR>", opts) -- show definition, references
					set("n", "<leader>Fe", "<cmd>FlutterEmulators<CR>", opts) -- show definition, references
					set("n", "<leader>FR", "<cmd>FlutterRestart<CR>", opts) -- show definition, references
					set("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", opts) -- show definition, references
					set("n", "<leader>Fd", "<cmd>FlutterDevTools<CR>", opts) -- show definition, references
					set("n", "<leader>Fn", "<cmd>FlutterDevTools<CR>", opts) -- show definition, references

					-- normal lsp mappings

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

					opts.desc = "Show documentation for what is under cursor"
					set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

					opts.desc = "Restart LSP"
					set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
				end,
			},
		})
	end,
}
