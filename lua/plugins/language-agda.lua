return {
	{
		"isovector/cornelis",
		name = "cornelis",
		ft = "agda",
		dependencies = { "neovimhaskell/nvim-hs.vim", "kana/vim-textobj-user" },
		version = "*",
		init = function()
			vim.g.cornelis_no_agda_input = 1
		end,
		config = function()
			-- Keybindings
			local opts = { buffer = true, noremap = true, silent = true }

			vim.keymap.set("n", "<leader>l", function()
				vim.cmd("CornelisLoad")
			end, vim.tbl_extend("force", opts, { desc = "Load source" }))

			vim.keymap.set("n", "<leader>L", function()
				vim.cmd("CornelisQuestionToMeta")
			end, vim.tbl_extend("force", opts, { desc = "Expand ?" }))

			vim.keymap.set("n", "<leader>c", "<cmd>CornelisMakeCase<CR>", opts)
			vim.keymap.set("n", "<leader>r", "<cmd>CornelisRefine<CR>", opts)
			vim.keymap.set("n", "<leader>i", "<cmd>CornelisTypeContextInfer<CR>", opts)
			vim.keymap.set(
				"n",
				"<leader>n",
				"<cmd>CornelisNextGoal<CR>",
				vim.tbl_extend("force", opts, { desc = "Select next goal" })
			)
			vim.keymap.set(
				"n",
				"<leader>p",
				"<cmd>CornelisPrevGoal<CR>",
				vim.tbl_extend("force", opts, { desc = "Select previous goal" })
			)
			vim.keymap.set("n", "gd", "<cmd>CornelisGoToDefinition<CR>", opts)
			vim.keymap.set("n", "<leader>s", "<cmd>CornelisSolve<CR>", opts)
			vim.keymap.set("n", "<leader>a", "<cmd>CornelisAuto<CR>", opts)
			vim.keymap.set(
				"n",
				"<leader>d",
				"<cmd>CornelisTypeInfer<CR>",
				vim.tbl_extend("force", opts, { desc = "Infer type" })
			)
			vim.keymap.set("n", "<leader>,", "<cmd>CornelisGive<CR>", vim.tbl_extend("force", opts, { desc = "Give" }))
			vim.keymap.set("n", "<leader>u", "<cmd>CornelisInputSymbol<CR>", opts)

			-- Binding for math
			local path = vim.fn.stdpath("config") .. "/dict/agda-symbols.json"
			local file = io.open(path, "r")

			if file == nil then
				vim.notify("Invalid path:" .. path, vim.log.levels.ERROR)
				return
			end

			local content = file:read("*a")
			file:close()

			local ok, symbols = pcall(vim.json.decode, content)

			if not ok then
				vim.notify("Invalid agda-symbols.json", vim.log.levels.ERROR)
				return
			end

			for trigger, symbol in pairs(symbols) do
				vim.fn["cornelis#bind_input"](trigger, symbol)
			end

			-- Exit all the windows when leave
			vim.api.nvim_create_autocmd("QuitPre", {
				pattern = "*.agda",
				command = "CornelisCloseInfoWindows",
			})
		end,
	},
}
