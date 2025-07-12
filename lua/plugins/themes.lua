return {
	{
		"tribela/transparent.nvim",
		event = "VimEnter",
		config = true,
		opts = {
			extra_groups = { "WinSeparator" }, -- Clear NeoTree border
		},
	},
	{
		"tinted-theming/tinted-vim",
		config = function()
			vim.cmd.colorscheme("base16-everforest-dark-hard") -- for mori
			-- vim.cmd.colorscheme("base16-phd") -- for furina blue
			-- vim.cmd.colorscheme("base16-horizon-dark") -- for calli pink

			-- below doesn't work for some reason. taken straight from the docs.
			-- (hence the plugin above)
			-- vim.g.tinted_background_transparent = true
		end,
	},
	{
		"Yazeed1s/oh-lucy.nvim",
	},
	{
		"everviolet/nvim",
		name = "evergarden",
		config = function()
			require("evergarden").setup({
				theme = {
					variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
					accent = "blue",
				},
				editor = {
					transparent_background = false,
					sign = { color = "none" },
					float = {
						color = "mantle",
						invert_border = false,
					},
					completion = {
						color = "surface0",
					},
				},
			})
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
			vim.g.gruvbox_material_enable_italic = true
		end,
	},
}
