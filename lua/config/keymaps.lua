local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("i", "jk", "<esc>", { desc = "Better esc" })
map("i", "<C-g>", "<esc>", { desc = "Better esc" })
map("n", "Y", "yy", { desc = "Better yank" })
map("n", "ss", "<cmd>write<cr>", { desc = "Emacs way saving" })
map("n", "<C-w>z", "<C-w>_|<C-w>|", { desc = "Zoom" })

map("n", "<C-x><C-x>", "<cmd>!make<cr>", { desc = "Emacs way saving" })
