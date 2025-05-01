return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"razak17/tailwind-fold.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
	},
	-- {
	-- 	"github/copilot.vim",
	-- },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
							},
						},
					})
				end,

				["omnisharp"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.omnisharp.setup({
						cmd = {
							"dotnet",
							vim.fn.expand(
								"C:/Users/Nyormensho/AppData/Local/nvim-data/mason/packages/omnisharp/libexec/OmniSharp.dll"
							),
						},
						root_dir = lspconfig.util.root_pattern("*.sln", ".git"),
						settings = {
							RoslynExtensionsOptions = { EnableImportCompletion = true },
							MsBuild = { LoadProjectsOnDemand = false },
						},
					})
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				-- configs
				yaml = { "yamllint" },
				sh = { "dotenv_linter" },

				-- programming
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "pylint" },

				-- styles
				css = { "stylelint" },
				scss = { "stylelint" },
				sass = { "stylelint" },
			}

			-- Wrap and override eslint_d parser to suppress config file missing error
			local eslint_d = require("lint.linters.eslint_d")
			local original_parser = eslint_d.parser

			eslint_d.parser = function(output, bufnr)
				if output:match("Could not find config file") then
					return {}
				end
				return original_parser(output, bufnr)
			end

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		cmd = "Telescope",
		lazy = false,
		opts = {
			defaults = {
				layout_config = {
					preview_width = 0.5,
				},
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			shell = "pwsh -nologo",
			direction = "float",
			open_mapping = "<A-\\>",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			-- Lighter highlights so my corneas stay intact before I turn 21
			vim.api.nvim_set_hl(0, "GitConflictCurrent", { fg = "#7aa2f7", bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictIncoming", { fg = "#9ece6a", bg = "NONE", bold = true })

			require("git-conflict").setup({
				default_mappings = true,
				default_commands = true,
				disable_diagnostics = false,
				list_opener = "copen",
				highlights = {
					incoming = "GitConflictIncoming",
					current = "GitConflictCurrent",
				},
			})
		end,
	},
}
