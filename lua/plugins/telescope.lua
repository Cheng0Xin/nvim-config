return {
	-- Telescope command menu
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader>o",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader> ",
				"<cmd>:Telescope<cr>",
				desc = "Find clips",
			},
		},
		opts = {},
    config = function()
      require("telescope").setup()
    end
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
