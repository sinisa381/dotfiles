return {
	-- Theme with light (latte) + dark (mocha) variants,
	-- chosen automatically from vim.o.background.
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "auto",
			background = { light = "latte", dark = "mocha" },
		},
	},

	-- Follow the macOS system appearance and flip the colorscheme to match.
	-- Replaces the old hand-rolled `defaults read` polling on a timer + BufEnter.
	{
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		dependencies = { "catppuccin/nvim" },
		opts = {
			update_interval = 3000,
			set_dark_mode = function()
				vim.o.background = "dark"
				vim.cmd.colorscheme("catppuccin")
			end,
			set_light_mode = function()
				vim.o.background = "light"
				vim.cmd.colorscheme("catppuccin")
			end,
		},
	},
}
