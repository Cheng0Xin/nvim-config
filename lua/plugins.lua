local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  checker = { enabled = false }, -- automatically check for plugin updates
  'wbthomason/packer.nvim',
  'echasnovski/mini.nvim',
  'neovim/nvim-lspconfig',
  'nvim-tree/nvim-web-devicons',

  -- For LSP completion (NOT CONF)
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/vim-vsnip',

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',

  -- Smooth movement
  {
    'gen740/SmoothCursor.nvim',
    config = function()
      require('smoothcursor').setup()
    end
  },

  -- auto complete brackets
  'm4xshen/autoclose.nvim',
  'ishan9299/nvim-solarized-lua',
  -- UI
  -- LuaLine
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  -- Tabline
  {
    'kdheepak/tabline.nvim',
    config = function()
      require 'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          section_separators = { '', '' },
          component_separators = { '', '' },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false,    -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true,        -- this shows devicons in buffer section
          show_bufnr = false,          -- this appends [bufnr] to buffer section,
          show_filename_only = false,  -- shows base filename only instead of relative path in filename
          modified_icon = "+ ",        -- change the default modified icon
          modified_italic = false,     -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false,      -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd [[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    requires = {
      { 'hoob3rt/lualine.nvim',         opt = true },
      { 'kyazdani42/nvim-web-devicons', opt = true } }
  },
  -- {
  --   'NTBBloodbath/galaxyline.nvim',
  --   -- your statusline
  --   config = function()
  --     -- require('galaxyline.themes.eviline')
  --     --
  --   end,
  --   -- some optional icons
  --   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  -- },
  'ray-x/lsp_signature.nvim',

  -- Lean theorem prover
  'Julian/lean.nvim',
  'nvim-lua/plenary.nvim', -- NOT CONF

  -- Rainbow
  'HiPhish/rainbow-delimiters.nvim',

  -- Ctrl-Space
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { { 'nvim-lua/plenary.nvim' } }
  },


  -- Typst
  { 'kaarmu/typst.vim',           ft = { 'typst' }, lazy = false },

  -- Color themes
  { 'marko-cerovac/material.nvim' },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'kepano/flexoki-neovim', name = 'flexoki' },
  { 'rebelot/kanagawa.nvim' },
  { 'rktjmp/lush.nvim' },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- your optional config goes here, see below.
    end,
  },
  { 'hachy/eva01.vim' },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
  },
  -- Comment
  {
    'numToStr/Comment.nvim',
    lazy = false,
  },
  -- Autopair
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- Unicode input
  'arthurxavierx/vim-unicoder',
  -- Marks
  'chentoast/marks.nvim',
  -- dotnet Razor
  'jlcrochet/vim-razor',
  -- dotnet FSharp
  'ionide/Ionide-vim'
}
