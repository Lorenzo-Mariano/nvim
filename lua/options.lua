-- vim.opt.relativenumber = true
vim.opt.number = true

-- turn off entering comments when entering new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Makes it so that there is only one statusline for the whole window
vim.o.laststatus = 3

-- Makes searching not case sensitive
vim.opt.ignorecase = true

-- Cutting or deleting sends to clipboard
-- vim.opt.clipboard = "unnamedplus"

-- Subtle highlight for cursor's current line
vim.opt.cursorline = true

-- Auto-indent when breaking to new line
vim.opt.smartindent = true

-- Keep indentation when from previous line
vim.opt.autoindent = true

-- When wrapping a long line, keep indentation
vim.opt.breakindent = true

-- When scrolling, keeps the cursor a lil' more centered
-- commented because of change to <C-D> and <C-U> keybinds
-- vim.opt.scrolloff = 8

vim.opt.termguicolors = true
