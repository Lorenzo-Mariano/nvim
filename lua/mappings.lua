vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- make ; open command mode
-- commented this out so that ; can repeat f + char keybind, and others.
-- map("n", ";", ":", { noremap = true })

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

-- Move focus
-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-l>", "<C-w>l", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-j>", "<C-w>j", opts)

-- Move splits around
map("n", "<leader>H", "<C-w>H", opts)
map("n", "<leader>L", "<C-w>L", opts)
map("n", "<leader>K", "<C-w>K", opts)
map("n", "<leader>J", "<C-w>J", opts)

-- buffer stuff, kill, next, prev
map("n", "<leader>bd", ":bd<CR>", opts)
map("n", "<leader>l", ":bnext<CR>", opts)
map("n", "<leader>h", ":bprevious<CR>", opts)

-- Scroll 10 lines, normal and visual, then center cursor
-- vim.api.nvim_set_keymap("n", "<C-U>", "10kzz", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-D>", "10jzz", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("v", "<C-U>", "10kzz", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-D>", "10jzz", { noremap = true, silent = true })

-- experimental fold stuff
vim.api.nvim_set_keymap("n", "zf", "v%zfzz", { noremap = true, silent = true })

-- select the whole buffer real quick
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
