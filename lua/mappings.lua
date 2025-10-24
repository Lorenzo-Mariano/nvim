vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Alt + S to save file
map("n", "<M-s>", ":w<CR>", opts)

-- Hit ge to show the lsp error
-- There is no keybind for this by default.
vim.keymap.set("n", "ge", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Use "y" to copy to the system clipboard
vim.api.nvim_set_keymap("v", "y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "yy", '"+yy', { noremap = true, silent = true })

-- Pick buffers rq
vim.api.nvim_set_keymap("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":bn<CR>", { noremap = true, silent = true })
