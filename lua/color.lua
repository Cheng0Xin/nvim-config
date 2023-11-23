local handle = io.popen("cat ~/.color")
if handle ~= nil then
  local back = handle:read("*a")
  handle:close()

  if string.find(back, "light") then
    vim.cmd.colorscheme("limestone")
    vim.cmd [[set cursorline]]
  else
    vim.cmd.colorscheme("mariana")
    vim.cmd [[set cursorline]]
  end

  return {
    X = back
  }
end
