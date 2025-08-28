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

	-- Clip management
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},

	-- TODO: management
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	-- Mark management
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
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
			{
				"<leader> ",
				"<cmd>:Telescope<cr>",
				desc = "Find clips",
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
		dependencies = {
			"4e554c4c/blink-cmp-agda-symbols",
		},
		version = "1.*",
		opts = {
			keymap = { preset = "super-tab" },

			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "agda_symbols", "lsp", "path", "snippets", "buffer" },
				providers = {
					agda_symbols = {
						name = "agda_symbols",
						module = "blink-agda-symbols",
						opts = {
							extra = {
								to = "→",
								lambda = "λ",
								eq = { "≡", "≐", "≃", "↔" },
								po = { "≲", "↩" },
							},
						},
					},
				},
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
			set("x", "s", mc.matchCursors)

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
	-- Spell check
	{
		"lucaSartore/fastspell.nvim",
		build = function()
			local base_path = vim.fn.stdpath("data") .. "/lazy/fastspell.nvim"
			local cmd = base_path .. "/lua/scripts/install." .. (vim.fn.has("win32") and "cmd" or "sh")
			vim.system({ cmd })
		end,

		config = function()
			local fastspell = require("fastspell")

			fastspell.setup({
				cspell_json_file_path = vim.fn.stdpath("config") .. "/cspell.json",
			})

			vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
				callback = function(_)
					local first_line = vim.fn.line("w0") - 1
					local last_line = vim.fn.line("w$")
					fastspell.sendSpellCheckRequest(first_line, last_line)
				end,
			})
		end,
	},
})

require("config.visual")
require("config.treesitter")
require("config.mason")
require("config.minis")
