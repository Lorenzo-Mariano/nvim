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
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					yaml = { "prettierd" },
					json = { "prettierd" },
					css = { "prettierd" },
					cs = { "csharpier" },

					-- Installed globally via composer, not mason.
					-- I'm facing problems because "composer.bat is not executable" <- mason
					php = { "pint" },
					blade = { "blade-formatter" },
				},
				format_after_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { lsp_format = "fallback" }
				end,
				-- format_on_save = {
				-- 	timeout_ms = 1400,
				-- },
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
	-- {
	-- 	"adalessa/laravel.nvim",
	-- 	dependencies = {
	-- 		"tpope/vim-dotenv",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"kevinhwang91/promise-async",
	-- 	},
	-- 	cmd = { "Laravel" },
	-- 	keys = {
	-- 		{ "<leader>la", ":Laravel artisan<cr>" },
	-- 		{ "<leader>lr", ":Laravel routes<cr>" },
	-- 		{ "<leader>lm", ":Laravel related<cr>" },
	-- 	},
	-- 	event = { "VeryLazy" },
	-- 	opts = {
	-- 		lsp_server = "intelephense",
	-- 	},
	-- 	config = true,
	-- },
}
