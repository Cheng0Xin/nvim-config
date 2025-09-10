return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- somewhere after requiring nvim-treesitter
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			parser_config.lean = {
				install_info = {
					url = "https://github.com/Julian/tree-sitter-lean", -- the grammar repo
					files = { "src/parser.c", "src/scanner.c" }, -- important: both if scanner exists
					branch = "main", -- or the default branch
				},
				filetype = "lean", -- set the Neovim filetype this parser applies to
			}

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"agda",
					"cpp",
					"haskell",
					"latex",
					"python",
					"racket",
					"rust",
					"scala",
					"typst",
					"lean",
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<A-o>", -- start selection with Alt+o
						node_incremental = "<A-o>", -- expand
						node_decremental = "<A-i>", -- shrink
						scope_incremental = "<A-s>", -- expand by scope
					},
				},
			})
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},
}
