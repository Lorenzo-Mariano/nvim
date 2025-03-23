vim.opt.relativenumber = true
vim.opt.number = true

-- turn off entering comments when entering new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
