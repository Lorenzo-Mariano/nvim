return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					yaml = { "prettierd" },
					json = { "prettierd" },
					cs = { "csharpier" },
				},
				format_on_save = {
					timeout_ms = 1500,
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "*",
		opts = {
			keymap = {
				["<C-u>"] = {
					function(cmp)
						cmp.scroll_documentation_up(4)
					end,
				},

				["<C-d>"] = {
					function(cmp)
						cmp.scroll_documentation_down(4)
					end,
				},

				["<C-l>"] = {
					function(cmp)
						cmp.show()
					end,
				},
			},
			appearance = {
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
