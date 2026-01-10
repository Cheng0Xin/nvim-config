local config = vim.fn.stdpath("config")

if vim.g.vscode then
	dofile(config .. "/vscode.lua")
else
	dofile(config .. "/normal.lua")
end
