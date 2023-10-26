vim.cmd { cmd = 'inoremap', args = { 'jk', '<esc>' } }
vim.cmd { cmd = 'inoremap', args = { '<C-g>', '<esc>' } }
vim.cmd { cmd = 'nnoremap', args = { 'H', '<Home>' } }
vim.cmd { cmd = 'nnoremap', args = { 'L', '<End>' } }
vim.cmd { cmd = 'nnoremap', args = { 'Y', 'yy' } }

vim.keymap.set('n', '<C-x><C-s>',
  function() vim.cmd.write() MiniTrailspace.trim() end)

vim.keymap.set('n', '<C-x>o',
  function() vim.cmd { cmd = 'Explore' } end)

-- Execute make
vim.keymap.set('n', '<C-x><C-x>',
  function() vim.cmd { cmd = '!', args = { 'make' } }  end)

-- Toggle spell
vim.keymap.set('n', '<C-x>s',
  function()
    if vim.g.spell == true then
      vim.cmd { cmd = 'set', args = { 'nospell'} }
      vim.g.spell = false
    else
      vim.cmd { cmd = 'set', args = { 'spell'} }
      vim.g.spell = true
    end
  end)

-- Find files or buffers
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<C-x><C-f>',
  function() telescope.find_files()  end)

vim.keymap.set('n', '<C-Space>',
  function() telescope.buffers() end)

-- Tools
vim.keymap.set('n', '<F8>', function() require"tools".switchColorscheme() end)
