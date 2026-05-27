return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local parser_config = require("nvim-treesitter.parsers")

			parser_config.lean = {
				install_info = {
					url = "https://github.com/Julian/tree-sitter-lean",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "main",
				},
				filetype = "lean",
			}

			parser_config.move = {
				install_info = {
					url = "https://github.com/MystenLabs/sui",
					location = "external-crates/move/tooling/tree-sitter",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "move",
			}

			ts.install({
				"cpp",
				"haskell",
				"latex",
				"python",
				"racket",
				"rust",
				"scala",
				"typst",
			})

			-- enable highlighting
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"cpp",
					"haskell",
					"tex",
					"python",
					"racket",
					"rust",
					"scala",
					"typst",
				},
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})

			vim.keymap.set({ "n", "x" }, "<A-o>", "an", {
				remap = true,
				desc = "Expand TS selection",
			})

			vim.keymap.set({ "n", "x" }, "<A-i>", "in", {
				remap = true,
				desc = "Shrink TS selection",
			})

			vim.keymap.set({ "n", "x" }, "<A-s>", "]n", {
				remap = true,
				desc = "Next TS node",
			})

			-- folding
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.opt.foldenable = false
		end,
	},
}
