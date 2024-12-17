-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.term = {
  float = {
    relative = "editor",
    row = 0.125,
    col = 0.1,
    height = 0.75,
    width = 0.8,
  },
}

M.base46 = {
  theme = "gruvbox",

  hl_override = {
    -- Comment = { italic = true },
    ["@comment"] = { fg = "#ffaf94" },
    LineNr = { fg = "#FFFED6" },
    WinSeparator = { fg = "#cdcdcd" },
    NvimTreeWinSeparator = { fg = "#cdcdcd" },
  },
}

return M
