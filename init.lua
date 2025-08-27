-- Basic settings
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
-- vim.opt.spelllang = { "en_us", "cjk" }
-- vim.opt.spell = true
vim.opt.wrap = true
vim.opt.linebreak = true -- break at word boundaries
vim.opt.breakindent = true -- preserve indent
vim.opt.textwidth = 0 -- disable auto line breaks
vim.opt.showbreak = "↳ " -- prefix for wrapped screen lines
vim.opt.breakindentopt = "shift:2,min:40,sbr"

-- Leader
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Display settings
vim.opt.termguicolors = true
vim.o.background = "dark"

-- Scrolling and UI settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

-- Title
vim.opt.title = true
vim.opt.titlestring = "MSN-04"

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

-- LSP
vim.lsp.inlay_hint.enable(true)
vim.print(vim.fn.stdpath("config"))

-- Bootstrap core
require("core.lazy")
require("core.keymaps")
require("center")

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "FileType" }, {
	callback = function()
		vim.wo.wrap = true
		vim.wo.linebreak = true
		vim.wo.breakindent = true
	end,
})

-- Back to previous location
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	-- group = "userconfig",
	desc = "return cursor to where it was last time closing the file",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})
