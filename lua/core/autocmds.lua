vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "FileType" }, {
	callback = function()
		vim.wo.wrap = true
		vim.wo.linebreak = true
		vim.wo.breakindent = true
	end,
})

-- Back to previous location
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	-- group = "userconfig",
	desc = "return cursor to where it was last time closing the file",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

-- Folding code blocks at the beginning
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		vim.cmd("normal! zM")
	end,
})
