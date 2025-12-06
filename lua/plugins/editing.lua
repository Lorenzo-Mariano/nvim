return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- I FINALLY FIGURED IT OUT!!!
			-- TURNS OUT THE SYNTAX HIGHLIGHTING WAS ALWAYS WONKY BECAUSE
			-- IT WAS NEVER FUNKING ON WHEN I HTOUGHT IT WAS!!!!
			vim.cmd("TSEnable highlight")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
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
					rust = { "rustfmt" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					yaml = { "prettierd" },
					json = { "prettierd" },
					toml = { "prettierd" },
					css = { "prettierd" },
					cs = { "csharpier" },
					markdown = { "prettierd" },
					sh = { "shfmt" },

					-- Installed globally via composer, not mason.
					-- I'm facing problems because "composer.bat is not executable" <- mason
					php = { "pint" },
					blade = { "blade-formatter" },
				},
				format_after_save = {
					lsp_format = "fallback",
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
				menu = {
					draw = {
						components = {
							-- customize the drawing of kind icons
							kind_icon = {
								text = function(ctx)
									-- default kind icon
									local icon = ctx.kind_icon
									-- if LSP source, check for color derived from documentation
									if ctx.item.source_name == "LSP" then
										local color_item = require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
										if color_item and color_item.abbr ~= "" then
											icon = color_item.abbr
										end
									end
									return icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									-- default highlight group
									local highlight = "BlinkCmpKind" .. ctx.kind
									-- if LSP source, check for color derived from documentation
									if ctx.item.source_name == "LSP" then
										local color_item = require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
										if color_item and color_item.abbr_hl_group then
											highlight = color_item.abbr_hl_group
										end
									end
									return highlight
								end,
							},
						},
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
	{
		"brianhuster/live-preview.nvim",
		opts = {
			browser = "zen-browser --new-window",
		},
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^6", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
	-- },
}
