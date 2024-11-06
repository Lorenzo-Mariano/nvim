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
  theme = "bearded-arc",
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
