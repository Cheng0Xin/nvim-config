require("lazy").setup({
	-- Dependences
	{ "nvim-lua/plenary.nvim" }, -- used by other plugins
	{ "nvim-tree/nvim-web-devicons" }, -- used by other plugins
	{ "lewis6991/gitsigns.nvim" },
	{ "echasnovski/mini.nvim", version = "*" },

	-- Jump everywhere
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<enter>",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	-- Themes, visualization
	{ "nvim-lualine/lualine.nvim" }, -- status line
	{ "nvim-tree/nvim-tree.lua" }, -- file browser
	{ "sphamba/smear-cursor.nvim", opts = {} }, -- UI
	{ "xero/evangelion.nvim" }, -- eva 01
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
	{ "rebelot/kanagawa.nvim" },
	{ "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

	-- Notification setup
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- File system management
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		lazy = false,
	},

	-- Telescope command menu
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader>o",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
		},
		opts = {},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- TreeSitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- LSP stuff
	{ "mason-org/mason.nvim" }, -- installs LSP servers
	{ "neovim/nvim-lspconfig" }, -- configures LSPs
	{ "mason-org/mason-lspconfig.nvim" }, -- links the two above

	-- Some LSPs don't support formatting, this fills the gaps
	{ "stevearc/conform.nvim" },
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "super-tab" },

			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"isovector/cornelis",
		name = "cornelis",
		ft = "agda",
		build = "stack install",
		dependencies = { "neovimhaskell/nvim-hs.vim", "kana/vim-textobj-user" },
		version = "*",
	},
	-- Multi-cursors
	{
		"jake-stewart/multicursor.nvim",
		branch = "1.0",
		config = function()
			local mc = require("multicursor-nvim")
			mc.setup()

			local set = vim.keymap.set

			-- Add or skip cursor above/below the main cursor.
			set({ "x" }, "<c-v>", function()
				mc.lineAddCursor(1)
			end)
			-- set({ "x" }, "<c-s-v>", function()
			-- 	mc.lineAddCursor(1)
			-- end)
			-- set({ "n", "x" }, "<leader><up>", function()
			-- 	mc.lineSkipCursor(-1)
			-- end)
			-- set({ "n", "x" }, "<leader><down>", function()
			-- 	mc.lineSkipCursor(1)
			-- end)

			-- Add or skip adding a new cursor by matching word/selection
			-- set({ "n", "x" }, "<leader>n", function()
			-- 	mc.matchAddCursor(1)
			-- end)
			-- set({ "n", "x" }, "<leader>s", function()
			-- 	mc.matchSkipCursor(1)
			-- end)
			-- set({ "n", "x" }, "<leader>N", function()
			-- 	mc.matchAddCursor(-1)
			-- end)
			-- set({ "n", "x" }, "<leader>S", function()
			-- 	mc.matchSkipCursor(-1)
			-- end)

			-- Add and remove cursors with control + left click.
			set("n", "<c-leftmouse>", mc.handleMouse)
			set("n", "<c-leftdrag>", mc.handleMouseDrag)
			set("n", "<c-leftrelease>", mc.handleMouseRelease)

			-- Disable and enable cursors.
			set({ "n", "x" }, "<c-q>", mc.toggleCursor)

			-- Mappings defined in a keymap layer only apply when there are
			-- multiple cursors. This lets you have overlapping mappings.
			mc.addKeymapLayer(function(layerSet)
				-- Select a different cursor as the main one.
				layerSet({ "n", "x" }, "<left>", mc.prevCursor)
				layerSet({ "n", "x" }, "<right>", mc.nextCursor)

				-- Delete the main cursor.
				layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

				-- Enable and clear cursors using escape.
				layerSet("n", "<esc>", function()
					if not mc.cursorsEnabled() then
						mc.enableCursors()
					else
						mc.clearCursors()
					end
				end)
			end)

			-- Customize how cursors look.
			local hl = vim.api.nvim_set_hl
			hl(0, "MultiCursorCursor", { reverse = true })
			hl(0, "MultiCursorVisual", { link = "Visual" })
			hl(0, "MultiCursorSign", { link = "SignColumn" })
			hl(0, "MultiCursorMatchPreview", { link = "Search" })
			hl(0, "MultiCursorDisabledCursor", { reverse = true })
			hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
			hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		end,
	},
})

require("config.visual")
require("config.treesitter")
require("config.mason")
require("config.minis")
