local api = vim.api
local M = {}

vim.g.cur_color_idx = 0

function M.getAllColors()
  return vim.fn.getcompletion("", "color")
end

function M.switchColorscheme()
  local myColors = {
    "tokyonight-day", "tokyonight-moon",
    "material", "moonlight", "Dracula",
    "Dracula_blood", "Mariana", "limestone"
  }
  vim.g.cur_color_idx = (vim.g.cur_color_idx + 1) % #myColors
  local curColor = myColors[vim.g.cur_color_idx]
  vim.cmd.colorscheme(curColor)
  print(curColor)
end

function M.getCurColor()
  print(M.getColors()[vim.g.cur_color_idx])
end

function M.getFormatLspInfo()
  local lsp_client = vim.lsp.get_active_clients()
  if #lsp_client == 0 then
    return nil
  else
    return lsp_client[1].name
  end
end

return M
