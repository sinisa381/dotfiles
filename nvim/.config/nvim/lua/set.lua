vim.g.mapleader = " "

-- General options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.swapfile = false
vim.wo.number = true

-- Save and quit mappings
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>s", ":write<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>q", ":quit<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>Q", ":q!<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>WQ", ":wqa<CR>", opts)

-- Buffer management
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bn", ":bn<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bp", ":bp<CR>", opts)

-- Navigation between panes
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)

-- Highlight removal
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")

-- Quick Escape in insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", opts)

-- Harpoon Key Mappings
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add File to Harpoon" })
vim.keymap.set(
	"n",
	"<leader>hh",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ desc = "Toggle Harpoon Menu" }
)
vim.keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Next File in Harpoon" })
vim.keymap.set(
	"n",
	"<leader>hp",
	"<cmd>lua require('harpoon.ui').nav_prev()<CR>",
	{ desc = "Previous File in Harpoon" }
)
