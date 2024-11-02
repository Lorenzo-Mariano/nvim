return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Uncomment this block if you want to include Treesitter
  -- {
  -- "nvim-treesitter/nvim-treesitter",
  -- opts = {
  -- ensure_installed = {
  -- "vim", "lua", "vimdoc",
  -- "html", "css"
  -- },
  -- },
  -- },
}

