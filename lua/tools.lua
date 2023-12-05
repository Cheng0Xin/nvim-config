local api = vim.api
local M = {}

vim.g.cur_color_idx = 0

function M.getAllColors()
  return vim.fn.getcompletion("", "color")
end

function M.switchColorscheme()
  local myColors = {
    "tokyonight-day", "tokyonight-moon", "material",
    "flexoki-dark", "flexoki-light",
    "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus",
    "bluloco-dark", "bluloco-light",
    "eva01", "eva01-LCL", "miasma"
  }
  vim.g.cur_color_idx = (vim.g.cur_color_idx + 1) % #myColors + 1
  local curColor = myColors[vim.g.cur_color_idx]
  vim.cmd.colorscheme(curColor)
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
