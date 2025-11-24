vim.opt.relativenumber = true
vim.opt.number = true

-- turn off entering comments when entering new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Makes it so that there is only one statusline for the whole window
vim.o.laststatus = 3

-- Don't change caret style based on mode.
-- This makes it more like normal vim.
-- Encourages looking at the status thingy.
vim.opt.guicursor = ""

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

-- Show where folds have been made
vim.opt.foldcolumn = "1"

vim.opt.termguicolors = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set tab width to 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- When pressing <Tab> in insert mode, insert spaces instead of a tab character
vim.opt.softtabstop = 4

-- Enable inline diagnostic messages
vim.diagnostic.config({ virtual_text = true })

-- Same thing but breaks to a virtual line below.
-- vim.diagnostic.config({ virtual_lines = true })
