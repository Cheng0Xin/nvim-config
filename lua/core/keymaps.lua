-- Basic
vim.keymap.set({ "n", "v" }, "<C-h>", "0")
vim.keymap.set({ "n", "v" }, "<C-l>", "$")
vim.keymap.set("v", "R", "p")
vim.keymap.set("n", "<S-h>", "<cmd>:bprevious<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>:bnext<cr>")
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set({ "n", "v" }, "mm", "%", { desc = "Jump between parens" })
vim.keymap.set("n", "Y", "yy", { desc = "Yank whole line" })
vim.keymap.set("n", "ss", "<cmd>:w<cr>", { desc = "Save" })
vim.keymap.set("n", "<C-x><C-s>", "<cmd>:w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>:bd<cr>", { desc = "Close buffer" })
-- vim.keymap.set("v", "s", function()
-- 	local w = vim.fn.input("Word: ")
-- 	vim.notify("Hello World!")
-- end)

-- For `Agda`
local function agda_filetype()
	local opts = { buffer = true, noremap = true, silent = true }

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
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.agda",
	callback = agda_filetype,
})

vim.api.nvim_create_autocmd("QuitPre", {
	pattern = "*.agda",
	command = "CornelisCloseInfoWindows",
})
