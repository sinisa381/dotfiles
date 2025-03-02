-- return {
--   {
--     "williamboman/mason.nvim",
--     opts = {
--       ensure_installed = {
--         "eslint-lsp",
--         "typescript-language-server",
--       },
--     },
--     lazy = false,
--     config = function()
--       require("mason").setup()
--     end,
--   },
--   {
--     "williamboman/mason-lspconfig.nvim",
--     lazy = false,
--     config = function()
--       require("mason-lspconfig").setup({
--         ensure_installed = { "lua_ls", "eslint" },
--       })
--     end,
--   },
--   {
--     "neovim/nvim-lspconfig",
--     version = "*",
--     lazy = false,
--     config = function()
--       local capabilities = require("cmp_nvim_lsp").default_capabilities()
--       local lspconfig = require("lspconfig")
--
--       local eslint_config_path = vim.fn.filereadable("eslint.config.mjs") == 1 and "eslint.config.mjs" or nil
--
--       lspconfig.ts_ls.setup({
--         capabilities = capabilities,
--       })
--
--       lspconfig.lua_ls.setup({
--         capabilities = capabilities,
--       })
--
--       -- ESLint LSP setup
--       lspconfig.eslint.setup({
--         capabilities = capabilities,
--         settings = {
--           eslint = {
--             configFile = eslint_config_path,  -- Use the specified ESLint config file
--           },
--         },
--         on_attach = function(client, bufnr)
--           -- Disable diagnostics if using `null-ls` for diagnostics
--           client.server_capabilities.documentDiagnosticsProvider = false
--         end,
--       })
--
--       -- Keybindings
--       vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--       vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--       vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--       vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
--     end,
--   },
-- }
--
return {
	-- tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
				"eslint-lsp",
			})
		end,
	},

	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			---@type lspconfig.options
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				eslint = {
					root_dir = function()
						-- Try finding eslint.config.(js|mjs) in the current directory or its parents
						local path = require("lspconfig.util").root_pattern(".git")()
						return path or vim.fn.getcwd() -- Fallback to current directory if not found
					end,

					settings = {
						workingDirectory = { mode = "auto" },
					},
				},

				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
			},
			setup = {},
		},
	},
	{
		"nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
}
