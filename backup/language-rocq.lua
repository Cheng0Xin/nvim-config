return {
	{
		"whonore/Coqtail",
		ft = { "coq" },
		config = function()
			-- vim.g.coqtail_coq_path = vim.fn.expand("~/.opam/default/bin")
			-- vim.g.coqtail_coq_prog = "coqidetop"
			-- vim.g.coqtail_treat_stderr_as_warning = 1

			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.v",
				callback = function()
					vim.bo.filetype = "coq"
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "coq",
				callback = function()
					vim.bo.commentstring = "(* %s *)"

					local opts = { buffer = true, noremap = true, silent = true }

					vim.keymap.set("n", "<leader>cs", "<cmd>CoqStart<CR>", opts)
					vim.keymap.set("n", "<leader>cq", "<cmd>CoqStop<CR>", opts)
					vim.keymap.set("n", "<leader>cn", "<cmd>CoqNext<CR>", opts)
					vim.keymap.set("n", "<leader>cu", "<cmd>CoqUndo<CR>", opts)
					vim.keymap.set("n", "<leader>ca", "<cmd>CoqToLine<CR>", opts)
					vim.keymap.set("n", "<leader>cr", "<cmd>CoqReset<CR>", opts)
					vim.keymap.set("n", "<leader>cc", "<cmd>CoqCheck<CR>", opts)
				end,
			})
		end,
	},
}
