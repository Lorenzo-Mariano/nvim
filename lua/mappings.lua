require "nvchad.mappings"
local nvterm = require "nvchad.term"
local cmp = require "lua/configs/cmp.lua"
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "t" }, "<C-j>", function()
  nvterm.toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
map("i", "<C-Space>", function()
  cmp.mapping.complete()
end, { desc = "Trigger completion" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
