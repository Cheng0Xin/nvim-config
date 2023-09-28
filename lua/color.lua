if vim.env['BACKGROUND'] == 'light' then
  vim.cmd.colorscheme("tokyonight-day")
  vim.cmd [[set cursorline]]
else
  vim.cmd.colorscheme("tokyonight-moon")
  vim.cmd [[set cursorline]]
end

