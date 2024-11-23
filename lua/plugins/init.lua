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
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup {
        -- table: default groups
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        -- table: additional groups that should be cleared
        extra_groups = {
          -- File tree crap
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "NvimTreeEndOfBuffer",
          "NvimTreeVertSplit",
          "VertSplit",

          -- Bufferline groups
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineModified",
          "BufferLineModifiedSelected",
          "BufferLineTab",
          "BufferLineTabSelected",
          "BufferLineTabClose",
          "BufferLineIndicatorSelected",

          -- sariling gawa maybe
          "TbFill", -- The thing that ain't the tabs specifically that spans the whole width of the buffer
          "NvimTreeWinSeparator",
        },
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      }
    end,
  },
}
