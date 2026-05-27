return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			vim.keymap.set("x", "<A-o>", "an", {
				remap = true,
				desc = "Expand TS selection",
			})

			vim.keymap.set("x", "<A-i>", "in", {
				remap = true,
				desc = "Shrink TS selection",
			})

			vim.keymap.set("x", "<A-s>", "]n", {
				remap = true,
				desc = "Next TS node",
			})
		end,
	},
}
