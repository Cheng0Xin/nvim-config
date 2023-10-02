local handle = io.popen("cat ~/.color")
if handle ~= nil then
  local back = handle:read("*a")
  handle:close()

  if string.find(back, "light") then
    vim.cmd.colorscheme("tokyonight-day")
    vim.cmd [[set cursorline]]
  else
    vim.cmd.colorscheme("tokyonight-moon")
    vim.cmd [[set cursorline]]
  end

  return {
    X=back
  }
end

