return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local function get_configured_linters()
				local lint_ok, lint = pcall(require, "lint")
				if not lint_ok then
					return ""
				end

				local ft = vim.bo.filetype
				local configured = lint.linters_by_ft[ft]

				if not configured or #configured == 0 then
					return "No Linter"
				end

				if type(configured) == "string" then
					return "󱉶 " .. configured
				elseif type(configured) == "table" then
					return "󱉶 " .. table.concat(configured, ", ")
				end

				return ""
			end

			require("lualine").setup({
				options = {
					globalstatus = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				-- I'm getting comfy with tmux and therefore also configging it.
				-- Let's see what it's like to live without this for a while.
				-- Still keeping the binds to switch buffers though.
				tabline = {
					-- lualine_a = { "buffers" },
					-- lualine_z = { "tabs" },
				},
				sections = {
					lualine_c = {
						{
							"filename",
							file_status = true,
							newfile_status = false,
							path = 1,
							shorting_target = 40,
							symbols = {
								modified = "[+]",
								readonly = "[-]",
								unnamed = "[No Name]",
								newfile = "[New]",
							},
						},
					},
					lualine_x = {
						"lsp_status",
						get_configured_linters,
						"filetype",
					},
				},
				extensions = {
					"lazy",
					"mason",
					"neo-tree",
					"toggleterm",
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- {
	-- 	"sphamba/smear-cursor.nvim",
	-- 	opts = {
	-- 		stiffness = 0.9,
	-- 		trailing_stiffness = 0.5,
	-- 		distance_stop_animating = 0.1,
	-- 	},
	-- },
	{
		"mikavilpas/yazi.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			{
				"<C-b>",
				"<cmd>Yazi cwd<cr>",
			},
		},
		opts = {
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>" },
				duration_multiplier = 0.5,
				easing = "quadratic",
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				signature = {
					enabled = false, -- to stop it from covering my whole face when typing
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			cmdline = {
				view = "cmdline",
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
