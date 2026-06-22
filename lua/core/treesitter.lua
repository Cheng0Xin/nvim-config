-- vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

for _, m in ipairs({
	{ "x", "<M-o>", "an", "Expand selection" },
	{ "x", "<M-i>", "in", "Shrink selection" },
	{ "n", "<M-o>", "van", "Expand selection" },
	{ "n", "<M-i>", "vin", "Shrink selection" },
}) do
	vim.keymap.set(m[1], m[2], m[3], {
		remap = true,
		silent = true,
		desc = m[4],
	})
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = "*.lalrpop",
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = "*.razor",
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = "*.move",
	callback = function()
		vim.treesitter.language.register("move_on_aptos", "move")
		vim.treesitter.start()
	end,
})
