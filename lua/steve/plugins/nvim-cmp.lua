return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"lukas-reineke/cmp-under-comparator",
	},
	config = function()
		local cmp = require("cmp")
		local types = require("cmp.types")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				autocomplete = {
					types.cmp.TriggerEvent.InsertEnter,
					types.cmp.TriggerEvent.TextChanged,
				},
				completeopt = "menu,menuone,preview,noselect, noinsert",
			},
			preselect = cmp.PreselectMode.None,
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					function(entry1, entry2)
						local kind1 = entry1:get_kind()
						kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
						local kind2 = entry2:get_kind()
						kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
						if kind1 ~= kind2 then
							if kind1 == types.lsp.CompletionItemKind.Snippet then
								return false
							end
							if kind2 == types.lsp.CompletionItemKind.Snippet then
								return true
							end
							local diff = kind1 - kind2
							if diff < 0 then
								return true
							elseif diff > 0 then
								return false
							end
						end
					end,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
					-- require("cmp-under-comparator").under,
				},
			},
		})
	end,
}
