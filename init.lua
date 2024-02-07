if vim.g.vscode then
  require("vscode.plugins")
  require("vscode.keymaps")
else
  require("config.lazy")
  require("lsp")
end
