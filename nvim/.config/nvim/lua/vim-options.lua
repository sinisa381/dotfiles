vim.g.background = "light"

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- Map jj to escape in insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

local opts = { noremap = true, silent = true }

-- Open a new file
vim.api.nvim_set_keymap("n", "<leader>e", ":edit<Space>", opts)

vim.wo.number = true
