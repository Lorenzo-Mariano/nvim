return {
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			stiffness = 0.9,
			trailing_stiffness = 0.5,
			distance_stop_animating = 0.1,
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,

		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {
						["<c-b>"] = "noop",
					},
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- signature = {
				-- 	enabled = false, -- to stop it from covering my whole face when typing
				-- },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
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
					return "󰦕  No Linter"
				end

				if type(configured) == "string" then
					return "󱉶 " .. configured
				elseif type(configured) == "table" then
					return "󱉶 " .. table.concat(configured, ", ")
				end

				return ""
			end

			require("lualine").setup({
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
						function()
							local clients = vim.lsp.get_active_clients({ bufnr = 0 })
							if #clients == 0 then
								return "No LSP"
							end
							return clients[1].name
						end,
						get_configured_linters,
						"encoding",
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
}
