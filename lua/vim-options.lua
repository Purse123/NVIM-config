--[[
We use meta-accessors for more information:

https://github.com/nanotee/nvim-lua-guide?tab=readme-ov-file#using-meta-accessors
]]

vim.cmd("set expandtab") -- convert tab character to space for consistent tab space
vim.cmd("set autoindent") -- copy indent from current line when starting new one
vim.cmd("set tabstop=2") -- spaces a tab character occupies on display
vim.cmd("set softtabstop=2") -- used for inserting/removing spaces with Tab/Backspace
vim.cmd("set shiftwidth=2") -- used for autoindent
vim.cmd("set ignorecase") -- ignore case when searching

vim.cmd("set splitright") -- split vertical window to right
vim.cmd("set splitbelow") -- split horizontal window to bottom

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set mouse=a")
vim.cmd("let g:netrw_liststyle = 3") -- make the :Ex explorer branch visible

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>**', ":nohl<CR>", { desc = "Clear search highlights" })  -- :nohl clear the search highlights

-- Key mapping for tabs
vim.keymap.set('n', '<leader>to', "<cmd>tabnew<CR>", { desc = "Open a new tab" })
vim.keymap.set('n', '<leader>tx', "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set('n', '<leader>tn', "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set('n', '<leader>tp', "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set('n', '<leader>tf', "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
