require("mason").setup()
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

-- Formatting setup
require("conform").setup({
	default_format_opts = { lsp_format = "fallback", timeout_ms = 20000 },
	formatters_by_ft = {
		lua = { "stylua" },
		scala = { "scalafmt" },
		python = { "isort", "black" },
	},
	formatters = {
		scalafmt = {
			command = "scalafmt",
			args = { "--stdin", "--stdout" },
			stdin = true,
			timeout_ms = 20000,
		},
	},
})

-- Format on saving
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
