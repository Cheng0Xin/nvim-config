local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("i", "jk", "<esc>", { desc = "Better esc" })
map("i", "jj", "<esc>", { desc = "Better esc" })
map("i", "kk", "<esc>", { desc = "Better esc" })
map("i", "<C-g>", "<esc>", { desc = "Better esc" })
map("n", "Y", "yy", { desc = "Better yank" })
map("n", "ss", "<cmd>write<cr>", { desc = "Emacs way saving" })
map("n", "<C-w>z", "<C-w>_|<C-w>|", { desc = "Zoom" })
map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
map({ "n", "v" }, "<C-H>", "<home>", { desc = "Left most" })
map({ "n", "v" }, "<C-L>", "<end>", { desc = "Right most" })
map("n", "<C-w>d", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })
-- map("n", "<leader>x", "<cmd>!make<cr>", { desc = "Execute makefile" })
map("n", "<leader>x", ":lua AsyncMake()<CR>", { desc = "Execute makefile" })
map("n", "<leader>a", "<cmd>AerialToggle!<CR>")
map("n", "<leader>o", "<cmd>Telescope find_files<CR>")
map("n", "<leader>s", function()
  vim.opt.spell = not (vim.opt.spell:get())
end)

function AsyncMake()
  local cmd = "make" -- Command to run
  -- Define handlers for job events
  local on_exit = function(job_id, exit_code, event)
    if exit_code == 0 then
      print("Make completed successfully")
    else
      print("Make failed with exit code: " .. exit_code)
    end
  end

  -- Start the job
  vim.fn.jobstart(cmd, {
    on_exit = on_exit,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end
