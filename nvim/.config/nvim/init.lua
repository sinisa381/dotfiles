if vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

vim.opt.termguicolors = true
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "javascript" },
  highlight = { enable = true },
  indent = { enable = true },
})
