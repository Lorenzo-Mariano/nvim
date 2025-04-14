vim.opt.relativenumber = true
vim.opt.number = true

-- turn off entering comments when entering new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Makes it so that there is only one statusline for the whole window
vim.o.laststatus = 3

-- Makes searching not case sensitive
vim.opt.ignorecase = true
