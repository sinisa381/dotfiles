return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- Store the current theme to avoid unnecessary reloads
			local current_flavour = nil

			-- Function to detect current theme directly from macOS
			local function get_theme()
				local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
				if handle then
					local result = handle:read("*a")
					handle:close()
					if result and result:match("Dark") then
						return "mocha"
					else
						return "latte"
					end
				end
				-- Default fallback
				return "mocha"
			end

			-- Function to apply theme
			local function apply_theme(show_notification)
				local new_flavour = get_theme()
				if new_flavour ~= current_flavour then
					current_flavour = new_flavour
					require("catppuccin").setup({
						flavour = new_flavour,
					})
					vim.cmd.colorscheme("catppuccin")
					if show_notification then
						vim.notify("🎨 Theme switched to " .. new_flavour, vim.log.levels.INFO)
					end
				end
			end

			-- Initial theme setup
			apply_theme(false)

			-- Set up a timer to check for theme changes every 30 seconds
			local timer = vim.loop.new_timer()
			timer:start(
				1000, -- Initial delay (1 second)
				30000, -- Repeat every 30 seconds
				vim.schedule_wrap(function()
					apply_theme(true)
				end)
			)

			-- Also check on these events for immediate updates
			vim.api.nvim_create_autocmd({
				"FocusGained", -- When switching back to Neovim
				"VimEnter", -- When starting Neovim
				"BufEnter", -- When entering a buffer
				"CmdlineLeave", -- After leaving command line (good time to check)
			}, {
				callback = function()
					apply_theme(true)
				end,
			})

			-- Create :ReloadTheme command for manual theme updates
			vim.api.nvim_create_user_command("ReloadTheme", function()
				apply_theme(true)
				print("🎨 Theme reloaded: " .. current_flavour)
			end, {})

			-- Clean up timer when Neovim exits
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					timer:stop()
					timer:close()
				end,
			})
		end,
	},
}
