return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "configs.colorizer"
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "configs.nvim-tree"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.treesitter"
    end,
    dependencies = {
      { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
    },
    build = ":TSUpdate",
  },
}
