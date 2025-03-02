-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=2")
-- vim.cmd("set softtabstop=2")
-- vim.cmd("set shiftwidth=2")
-- vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
-- Map jj to escape in insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

local opts = { noremap = true, silent = true }

-- Save the current file
-- vim.api.nvim_set_keymap("n", "<leader>w", ":write<CR>", opts)
--
-- Save all files
vim.api.nvim_set_keymap("n", "<leader>wa", ":wall<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>nh", ":nohlsearch<CR>", opts)

-- Quit the current window
vim.api.nvim_set_keymap("n", "<leader>q", ":quit<CR>", opts)

-- Save and quit the current window
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<CR>", opts)

-- Force quit the current window without saving
vim.api.nvim_set_keymap("n", "<leader>Q", ":q!<CR>", opts)

-- Save all files and quit
vim.api.nvim_set_keymap("n", "<leader>WQ", ":wqa<CR>", opts)

-- Close the current buffer
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Open a new file
vim.api.nvim_set_keymap("n", "<leader>e", ":edit<Space>", opts)

-- vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
