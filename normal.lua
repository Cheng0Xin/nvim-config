-- Basic settings
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.wrap = true
vim.opt.linebreak = true -- break at word boundaries
vim.opt.breakindent = true -- preserve indent
vim.opt.textwidth = 0 -- disable auto line breaks
vim.opt.showbreak = "↳ " -- prefix for wrapped screen lines
vim.opt.breakindentopt = "shift:2,min:40,sbr"
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.clipboard:append({ "unnamed", "unnamedplus" }) -- Use system clipboard
vim.opt.termguicolors = true -- Display settings
vim.opt.mouse = a

-- Scrolling and UI settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Title
vim.opt.title = true
vim.opt.titlestring = "󱎶 %{fnamemodify(getcwd(), ':t')}"

-- Tab stuff
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search configuration
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- open new split panes to right and below (as you probably expect)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Bootstrap core
require("core.lazy")
require("lazy").setup({
	spec = {
		{ import = "plugins" }, -- <-- this pulls in all lua/plugins/*.lua
	},
})
require("core.keymaps")
require("core.autocmds")
