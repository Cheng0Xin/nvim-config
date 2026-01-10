return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,

		config = function()
			vim.opt.termguicolors = true
			local bfline = require("bufferline")

			bfline.setup({})

			vim.keymap.set("n", "<S-h>", "<cmd>:BufferLineCyclePrev<cr>")
			vim.keymap.set("n", "<S-l>", "<cmd>:BufferLineCycleNext<cr>")

			vim.keymap.set("n", "<S-A-h>", "<cmd>:BufferLineMovePrev<cr>")
			vim.keymap.set("n", "<S-A-l>", "<cmd>:BufferLineMoveNext<cr>")
		end,
	},
	{
		"mistweaverco/bafa.nvim",
		opts = {

			notify = {
				provider = "vim.notify",
			},
			ui = {
				render = {
					custom_format_buffer_line = nil,
				},
				-- 🧭 Buffer ordering configuration
				sort = {
					method = "manual",
					focus_alternate_buffer = false,
				},
				jump_labels = {
					keys = {
						"a",
						"s",
						"d",
						"f",
						"j",
						"k",
						"l",
						";",
						"q",
						"w",
						"e",
						"r",
						"u",
						"i",
						"o",
						"p",
						"z",
						"x",
						"c",
						"n",
						"m",
						",",
						".",
					},
				},
				-- 🚨 Show diagnostics in the UI
				diagnostics = true,
				line_numbers = false,
				title = {
					text = "🦥",
					pos = "center",
				},
				border = "rounded",
				style = "minimal",
				position = {
					preset = "center",
					row = nil,
					col = nil,
				},
				icons = {
					diagnostics = {
						Error = "", -- Icon for error diagnostics
						Warn = "", -- Icon for warning diagnostics
						Info = "", -- Icon for info diagnostics
						Hint = "", -- Icon for hint diagnostics
					},
					sign = {
						changes = "┃", -- Sign character for modified/deleted buffers
					},
				},
				hl = {
					sign = {
						modified = "GitSignsChange", -- Highlight group for modified buffer signs (fallback: DiffChange)
						deleted = "GitSignsDelete", -- Highlight group for deleted buffer signs (fallback: DiffDelete)
					},
				},
			},
		},
		config = function()
			local bafa = require("bafa")
			bafa.setup(opts)

			-- Toggle buffer manager
			vim.keymap.set("n", "<leader>b", function()
				bafa.toggle({
					with_jump_labels = true,
				})
			end, opts)
		end,
	},
}
