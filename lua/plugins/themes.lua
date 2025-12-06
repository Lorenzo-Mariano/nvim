return {
	{
		"tribela/transparent.nvim",
		-- cmd = { "TransparentToggle", "TransparentEnable", "TransparentDisable" },
		config = true,
		opts = {
			extra_groups = { "WinSeparator", "FoldColumn" },
		},
	},
	{
		"tinted-theming/tinted-vim",
		config = function()
			-- ol' reliable
			-- vim.cmd.colorscheme("base16-gruvbox-material-dark-hard")

			-- this is like helix!
			-- vim.cmd.colorscheme("base16-material-palenight")

			-- for winter background
			-- vim.cmd.colorscheme("base16-nord")

			-- for mori
			-- Also good for emudotto. Vibrant green strings.
			-- vim.cmd.colorscheme("base16-ayu-mirage")
			-- vim.cmd.colorscheme("base16-rose-pine-moon")

			-- this one and below are lower contrast, and colors still fit rather well.
			-- vim.cmd.colorscheme("base16-sandcastle")
			-- vim.cmd.colorscheme("base16-everforest-dark-hard")

			-- Other themes
			-- vim.cmd.colorscheme("base16-phd") -- for furina blue
			-- vim.cmd.colorscheme("base16-horizon-dark") -- for calli pink

			-- below doesn't work for some reason. taken straight from the docs.
			-- (hence the plugin above)
			-- vim.g.tinted_background_transparent = true
		end,
	},
	{
		"anAcc22/sakura.nvim",
		dependencies = "rktjmp/lush.nvim",
		config = function()
			vim.opt.background = "dark" -- or "light"
			vim.cmd("colorscheme sakura") -- sets the colorscheme
		end,
	},
	-- {
	-- 	"Yazeed1s/oh-lucy.nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("oh-lucy")
	-- 	end,
	-- },
	-- {
	-- 	"everviolet/nvim",
	-- 	name = "evergarden",
	-- 	config = function()
	-- 		require("evergarden").setup({
	-- 			theme = {
	-- 				-- imo, only winter looks good here.
	-- 				-- 'winter'|'fall'|'spring'|'summer'
	-- 				variant = "winter",
	-- 				-- this mostly changes stuff in lualine.
	-- 				-- green looks good, or a color that complements it.
	-- 				-- accent = "blue",
	-- 			},
	-- 			editor = {
	-- 				-- woah this actually works
	-- 				-- transparent_background = true,
	-- 				sign = { color = "none" },
	-- 				float = {
	-- 					color = "mantle",
	-- 					invert_border = false,
	-- 				},
	-- 				completion = {
	-- 					color = "surface0",
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		vim.cmd.colorscheme("evergarden")
	-- 	end,
	-- },
	-- This is the goated gruvbox version though.
	-- Lualine has brown normal mode, is redder too.
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
	-- 		vim.g.gruvbox_material_enable_italic = true
	-- 		vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- },
}
