require "nvchad.mappings"
local cmp = require "cmp"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<C-Space>", function()
  cmp.mapping.complete()
end, { desc = "Trigger completion" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
