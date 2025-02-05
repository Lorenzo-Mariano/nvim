return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    lazy = false,
    opts = require "configs.nvimtree",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    lazy = false,
    opts = function()
      return require "configs.telescope"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        user_default_options = {
          tailwind = true,
        },
      }
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup {
        extra_groups = {
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "NvimTreeNormalEndOfBuffer",
          "NvimTreeVertSplit",
          "VertSplit",
          "NvimTreeWinSeparator",
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
