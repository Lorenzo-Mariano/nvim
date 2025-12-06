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
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				filetypes = {
					sh = function()
						if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
							return false
						end
						return true
					end,
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = "CopilotChat",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		config = function()
			require("CopilotChat").setup({
				-- https://docs.github.com/en/copilot/reference/ai-models/model-comparison
				-- model = "claude-3.7-sonnet", -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
				model = "gpt-5-mini",
				selection = function(source)
					local select = require("CopilotChat.select")
					return select.visual(source)
				end,
				window = {
					layout = "float",
					height = 0.75,
					width = 0.75,
				},
				mappings = {
					submit_prompt = {
						normal = "<M-s>",
						insert = "<M-s>",
					},
					reset = {
						normal = "<C-x>",
						insert = "<C-x>",
					},
				},
			})

			local map = vim.api.nvim_set_keymap
			map("n", "<leader>cc", ":CopilotChatToggle<CR>", { noremap = true, silent = true })
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				-- configs
				yaml = { "yamllint" },

				-- programming
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "pylint" },
				markdown = { "rumdl" },
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
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		cmd = "Telescope",
		lazy = false,
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						width = 0.9,
						preview_width = 0.6,
					},
				},
			})

			require("telescope").load_extension("ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>th", builtin.colorscheme, { desc = "Telescope select theme" })
			vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Telescope marks" })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			-- shell = "pwsh -nologo",
			shell = "bash",
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
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})
		end,
	},
}
