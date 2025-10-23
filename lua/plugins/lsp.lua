return {
	-- LSP settings
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	}, -- installs LSP servers
	{ "neovim/nvim-lspconfig" }, -- configures LSPs
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"texlab",
					"pyright",
					"rust_analyzer",
					"tinymist",
				},
			})
			vim.lsp.config("hls", {
				filetypes = { "haskell", "lhaskell", "cabal" },
			})
			vim.lsp.enable("hls")
			vim.lsp.enable("agda_ls")
			vim.lsp.enable("metals")
			vim.lsp.enable("racket_langserver")
			vim.lsp.enable("terraform_lsp")
			vim.lsp.inlay_hint.enable(true)

			-- Show diagnostics as virtual text, signs, and underlines
			vim.diagnostic.config({
				virtual_text = true, -- inline text
				signs = true, -- gutter signs
				underline = true, -- highlight under text
				update_in_insert = false, -- don't update while typing
				severity_sort = true, -- sort by severity
			})

			-- Lua language configuration for neovim only
			vim.lsp.config("lua_ls", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
				settings = {
					Lua = {},
				},
			})
		end,
	}, -- links the two above
	-- Some LSPs don't support formatting, this fills the gaps
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				default_format_opts = { lsp_format = "fallback", timeout_ms = 20000 },
				formatters_by_ft = {
					lua = { "stylua" },
					scala = { "scalafmt" },
					python = { "isort", "black" },
					xml = { "xmllint" },
				},
				formatters = {
					scalafmt = {
						command = "scalafmt",
						args = { "--stdin", "--stdout" },
						stdin = true,
						timeout_ms = 20000,
					},
					xmllint = {
						command = "xmllint",
						args = { "--format", "-" }, -- <- read from stdin via "-"
						stdin = true, -- conform reads output from stdout
						timeout_ms = 20000,
					},
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	-- Complete
	{
		"saghen/blink.cmp",
		-- dependencies = {
		-- 	"4e554c4c/blink-cmp-agda-symbols",
		-- },
		version = "1.*",
		opts = {
			keymap = { preset = "super-tab" },

			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = true } },
			-- sources = {
			-- 	default = { "lsp", "path", "snippets", "buffer", "agda_symbols" },
			-- 	providers = {
			-- 		agda_symbols = {
			-- 			name = "agda_symbols",
			-- 			module = "blink-agda-symbols",
			-- 			opts = {
			-- 				extra = {
			-- 					to = "→",
			-- 					lambda = "λ",
			-- 					eq = { "≡", "≐", "≃", "↔" },
			-- 					po = { "≲", "↩" },
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
