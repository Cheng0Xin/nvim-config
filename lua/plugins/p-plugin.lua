return {
  "Julian/lean.nvim",
  { "kaarmu/typst.vim", ft = { "typst" }, lazy = false },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  "arthurxavierx/vim-unicoder",
  -- dotnet Razor
  "jlcrochet/vim-razor",
  -- dotnet FSharp
  "ionide/Ionide-vim",
  -- For lsp
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/vim-vsnip",
}
