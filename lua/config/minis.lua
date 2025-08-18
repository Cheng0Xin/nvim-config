require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.indentscope").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()
require("mini.comment").setup()

-- Trim trailing white space & empty lines before writing
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		require("mini.trailspace").trim()
		require("mini.trailspace").trim_last_lines()
	end,
})
