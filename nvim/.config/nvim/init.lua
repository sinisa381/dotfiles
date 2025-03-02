-- if vim.fn.has("termguicolors") == 1 then
--   vim.o.termguicolors = true
-- end
--
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("vim-options")
-- require("remap")
-- require("set")
-- require("lazy").setup("plugins")
--
-- vim.opt.termguicolors = true

-- local config = require("nvim-treesitter.configs")
-- config.setup({
--   ensure_installed = { "lua", "javascript", "typescript" },
--   highlight = { enable = true },
--   indent = { enable = true },
-- })
-- Enable termguicolors for better color support
if vim.fn.has("termguicolors") == 1 then
	vim.o.termguicolors = true
end

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("lspconfig").eslint.setup({
	root_dir = require("lspconfig.util").root_pattern(".eslintrc*", "package.json", ".git"),
})

-- Load other custom configurations
require("vim-options")
require("remap")
require("set")
