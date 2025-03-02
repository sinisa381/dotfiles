vim.g.mapleader = " "

-- File Explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines with cursor stay
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll with cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search with cursor centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- LSP Restart
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>")

-- Vim-With-Me
vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)

-- Better paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Clipboard mappings
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Formatting
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- TODO see what k j do
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace
-- vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x current file
vim.keymap.set("n", "<leader>xc", "<cmd>!chmod +x %<CR>", { silent = true })

-- Insert 'if err != nil'
vim.keymap.set("n", "<leader>er", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- Open config file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
