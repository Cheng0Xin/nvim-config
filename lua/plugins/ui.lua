return {
	-- Themes, visualization
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
			function switch_theme()
				local sysname = vim.loop.os_uname().sysname

				if sysname == "Darwin" then
					local apple_interface_style = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
					if apple_interface_style:gsub("%s+", "") == "Dark" then
						vim.cmd.colorscheme("kanagawa-dragon")
						vim.o.background = "dark"
					else
						vim.print("Light")
						vim.cmd.colorscheme("kanagawa-lotus")
						vim.o.background = "light"
					end
				else
					vim.cmd.colorscheme("kanagawa-lotus")
				end
			end
			switch_theme()
		end,
	}, -- status line
	{ "sphamba/smear-cursor.nvim", opts = {} }, -- UI
	{ "xero/evangelion.nvim" }, -- eva 01
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
	{ "rebelot/kanagawa.nvim" },
	{ "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

	-- Notification setup
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						-- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})
		end,
	},
}
