vim.g.mapleader = " "
vim.g.maplocalleader = " "

local builtin = require("telescope.builtin")
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- make ; open command mode
map("n", ";", ":", { noremap = true })

-- Alt + S to save file
map("n", "<M-s>", ":w<CR>", opts)

-- Hit ge to show the lsp error
vim.keymap.set("n", "ge", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Use "p" to paste from the system clipboard
vim.api.nvim_set_keymap("n", "p", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "P", '"+P', { noremap = true, silent = true })

-- Use "y" to copy to the system clipboard
vim.api.nvim_set_keymap("v", "y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "yy", '"+yy', { noremap = true, silent = true })

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set tab width to 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- When pressing <Tab> in insert mode, insert spaces instead of a tab character
vim.opt.softtabstop = 4

-- Telescope stuff
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Move focus
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-j>", "<C-w>j", opts)

-- Toggle Neotree
map("n", "<C-b>", ":Neotree toggle<CR>", opts)

-- Toggle NvimTree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- Scroll exactly 5 lines instead of half a screen
vim.api.nvim_set_keymap("n", "<C-U>", "5k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-D>", "5j", { noremap = true, silent = true })
