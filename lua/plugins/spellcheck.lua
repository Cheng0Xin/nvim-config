return {
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
	}
}
