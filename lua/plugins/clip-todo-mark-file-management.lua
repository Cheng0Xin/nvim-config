return {
	-- Clip management
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},

	-- TODO: management
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- Mark management
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- File system management
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		lazy = false,
		config = function()
			require("oil").setup()
		end,
	},
	-- File browser
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup() -- the tree file browser panel
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
