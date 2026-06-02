return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local list_of_languages =
				{ "agda", "cpp", "haskell", "latex", "python", "racket", "rust", "scala", "typst", "lua" }

			require("nvim-treesitter").install(list_of_languages)
		end,
	},
}
