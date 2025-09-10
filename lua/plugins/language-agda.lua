return {
	{
		"isovector/cornelis",
		name = "cornelis",
		ft = "agda",
		build = "stack install",
		dependencies = { "neovimhaskell/nvim-hs.vim", "kana/vim-textobj-user" },
		version = "*",
		config = function()
			local function agda_filetype()
				local opts = { buffer = true, noremap = true, silent = true }
				vim.g.cornelis_no_agda_input = 1

				vim.keymap.set("n", "<leader>l", function()
					vim.cmd("CornelisLoad")
					vim.cmd("CornelisQuestionToMeta")
				end, { desc = "Load source and expand ?" }, opts)
				vim.keymap.set("n", "<leader>c", ":CornelisMakeCase<CR>", opts)
				vim.keymap.set("n", "<leader>r", ":CornelisRefine<CR>", opts)
				vim.keymap.set("n", "<leader>i", ":CornelisTypeContextInfer<CR>", opts)
				vim.keymap.set("n", "<leader>n", "<cmd>CornelisNextGoal<cr>", { desc = "Sel next goal" }, opts)
				vim.keymap.set("n", "<leader>p", "<cmd>CornelisPrevGoal<cr>", { desc = "Sel pre goal" }, opts)
				vim.keymap.set("n", "gd", ":CornelisGoToDefinition<CR>", opts)
				vim.keymap.set("n", "<leader>s", ":CornelisSolve<CR>", opts)
				vim.keymap.set("n", "<leader>a", ":CornelisAuto<CR>", opts)
				vim.keymap.set("n", "<leader>d", "<cmd>CornelisTypeInfer<cr>", { desc = "Infer given type" }, opts)
				vim.keymap.set("n", "<leader>,", "<cmd>CornelisGive<cr>", { desc = "Infer given type" }, opts)
				-- vim.keymap.set("n", "<leader>,", ":CornelisTypeContext<CR>", opts)
				-- -- vim.keymap.set("n", "<C-A>", ":CornelisInc<CR>", opts)
				-- vim.keymap.set("n", "<C-X>", ":CornelisDec<CR>", opts)
				vim.keymap.set("n", "<leader>u", "<cmd>CornelisInputSymbol<CR>", { buffer = true })
			end

			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.agda",
				callback = agda_filetype,
			})

			vim.api.nvim_create_autocmd("QuitPre", {
				pattern = "*.agda",
				command = "CornelisCloseInfoWindows",
			})
		end,
	},
}
