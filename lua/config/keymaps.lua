local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("i", "jk", "<esc>", { desc = "Better esc" })
map("i", "jj", "<esc>", { desc = "Better esc" })
map("i", "kk", "<esc>", { desc = "Better esc" })
map("i", "<C-g>", "<esc>", { desc = "Better esc" })
map("n", "Y", "yy", { desc = "Better yank" })
map("n", "ss", "<cmd>write<cr>", { desc = "Emacs way saving" })
map("n", "<C-w>z", "<C-w>_|<C-w>|", { desc = "Zoom" })
map("n", "<C-H>", "<home>", { desc = "Left most" })
map("n", "<C-L>", "<end>", { desc = "Right most" })
map("n", "<C-w>d", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })
