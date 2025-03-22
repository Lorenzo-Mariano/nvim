vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', ';', ':', { noremap = true })

-- Alt + S to save file
map('n', '<M-s>', ':w<CR>', opts)

