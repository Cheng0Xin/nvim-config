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
-- some stuff so code folding uses treesitter instead of older methods
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
