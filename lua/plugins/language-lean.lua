return {
	{
		"Julian/lean.nvim",
		event = { "BufReadPre *.lean", "BufNewFile *.lean" },

		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- for 2 Lean-specific pickers
		},

		opts = {
			mappings = true,
		},

		config = function()
			require("lean").setup({})
			local function lean_filetype()
				local opts = { buffer = true, noremap = true, silent = true }
				vim.keymap.set("n", "<leader>i", ":LeanInfoviewToggle<CR>", opts)
				vim.keymap.set("n", "<leader>p", ":LeanInfoviewPinTogglePause<CR>", opts)
				vim.keymap.set("n", "<leader>r", ":LeanRestartFile<CR>", opts)
				vim.keymap.set("n", "<leader><Tab>", ":LeanGotoInfoview<CR>", opts)
				vim.keymap.set("n", "<leader>\\", ":LeanAbbreviationsReverseLookup<CR>", opts)
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "lean",
				callback = function()
					vim.bo.commentstring = "-- %s"
				end,
			})

			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.lean",
				callback = lean_filetype,
			})

			vim.api.nvim_create_autocmd("QuitPre", {
				pattern = "*.lean",
				command = "LeanInfoviewToggle",
			})
		end,
	},
}
