function switch_theme()
	local sysname = vim.loop.os_uname().sysname

	if sysname == "Darwin" then
		local apple_interface_style = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
		if apple_interface_style:gsub("%s+", "") == "Dark" then
			vim.cmd.colorscheme("evangelion")
		else
			vim.print("Light")
			vim.cmd.colorscheme("kanagawa-lotus")
		end
	end
end
