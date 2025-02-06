require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "t" }, "<A-\\>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

map("n", "ge", function()
  vim.diagnostic.open_float { scope = "line" }
end, { desc = "Show diagnostics for the current line" })

map("n", "<A-s>", "<cmd>w<CR>", {
  desc = "Other keybind to save file",
})
