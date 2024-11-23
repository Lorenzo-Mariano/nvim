-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.term = {
  float = {
    relative = "editor",
    row = 0.125,
    col = 0.275,
    height = 0.75,
    width = 0.45,
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.base46 = {
  theme = "gruvbox",
  -- transparency = true,
  -- Was trying to make the main bg trans, and the terms not.
  -- Didn't really make it stick, but worth leaving here.

  -- changed_themes = {
  --   ayu_dark = {
  --     base_16 = {
  --       base00 = "",
  --     },
  --     base_30 = {
  --       darker_black = "",
  --       black = "",
  --       one_bg2 = "",
  --       -- light_grey = "#545351",
  --       -- black2 = "#545351", -- from bg of terminal, famine eating pizza, with bg img opacity @ 20%
  --       line = "#dddddd",
  --       statusline_bg = "",
  --     },
  --   },
  -- },

  -- use :highlight to list available options.
  hl_override = {
    -- for some reason the var name doesn't always work, in
    -- which case I am kinda forced to do below instead.
    ["@comment"] = { fg = "#ffaf94", italic = true },

    -- Line number on the side
    LineNr = { fg = "#FFFED6" },

    -- Float border used to be blue.
    FloatBorder = { fg = "#474747" },

    -- The lines that separate the panels.
    WinSeparator = { fg = "#cdcdcd" },
    NvimTreeWinSeparator = { fg = "#cdcdcd" },

    -- this does not seem to work, despite autocomplete
    -- Comment = { fg = "teal", italic = true },
  },
}

return M
