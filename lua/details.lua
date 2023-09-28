-- SmoothCursor setting
require('smoothcursor').setup({
  autostart = true,
  cursor = "",              -- cursor shape (need nerd font)
  texthl = "SmoothCursor",   -- highlight group, default is { bg = nil, fg = "#FFD400" }
  linehl = nil,              -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
  type = "default",          -- define cursor movement calculate function, "default" or "exp" (exponential).
  fancy = {
    enable = false,        -- enable fancy mode
    head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
    body = {
      { cursor = "", texthl = "SmoothCursorRed" },
      { cursor = "", texthl = "SmoothCursorOrange" },
      { cursor = "●", texthl = "SmoothCursorYellow" },
      { cursor = "●", texthl = "SmoothCursorGreen" },
      { cursor = "•", texthl = "SmoothCursorAqua" },
      { cursor = ".", texthl = "SmoothCursorBlue" },
      { cursor = ".", texthl = "SmoothCursorPurple" },
    },
    tail = { cursor = nil, texthl = "SmoothCursor" }
  },
  flyin_effect = nil,        -- "bottom" or "top"
  speed = 25,                -- max is 100 to stick to your current position
  intervals = 35,            -- tick interval
  priority = 10,             -- set marker priority
  timeout = 3000,            -- timout for animation
  threshold = 3,             -- animate if threshold lines jump
  disable_float_win = false, -- disable on float window
  enabled_filetypes = nil,   -- example: { "lua", "vim" }
  disabled_filetypes = nil,  -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
})

-- Spell
vim.opt.spelllang = 'en_us'
vim.g.spell = false

-- Lualine setting
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'searchcount', 'selectioncount'},
    lualine_c = {'filename'},
    lualine_x = {require"tools".getFormatLspInfo, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Comment
require('Comment').setup({})
