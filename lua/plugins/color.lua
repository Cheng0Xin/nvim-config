return {
  -- add gruvbox
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "NLKNguyen/papercolor-theme" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa",
      colorscheme = "rose-pine",
      -- colorscheme = "PaperColor",
    },
  },
}
