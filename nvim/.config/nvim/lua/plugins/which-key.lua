return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")

		--- Logs the visually selected text or the word under the cursor to the current buffer.
		function LogSelectionOrWord()
			local selection = ""

			if vim.fn.mode() == "v" then
				-- Yank the visual selection into register l
				vim.cmd('normal! "ly')
				selection = vim.fn.getreg("l") -- Get the yanked selection
			else
				-- Select the word under the cursor and yank it
				vim.cmd('normal! viw"ly')
				selection = vim.fn.getreg("l")
			end

			-- Construct the log statement
			local logStatement = "console.log('" .. selection .. "', " .. selection .. ");"

			-- Insert log statement on the next line
			vim.cmd("normal! o" .. logStatement)
		end

		wk.setup({
			-- setup options here, if you have any
		})

		wk.add({
			{
				-- Nested mappings are allowed and can be added in any order
				-- Most attributes can be inherited or overridden on any level
				-- There's no limit to the depth of nesting
				mode = { "n", "v" }, -- NORMAL and VISUAL mode
				{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
				{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
				{ "<leader>l", LogSelectionOrWord, desc = "Log Visual Selection" },
			},
		}, { prefix = "<leader>" }) -- Add prefix to the mappings
	end,
}
