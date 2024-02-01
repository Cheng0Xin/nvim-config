local Util = require("lazyvim.util")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("auto_wrap"),
  callback = function()
    vim.cmd({ cmd = "set", args = { "wrap" } })
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "fsharp" },
  command = [[setlocal commentstring=//%s]],
})
