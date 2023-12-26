local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local installed, basic = pcall(require, "nvim-basic")

if installed then
	basic.setup()
end

require("lazy").setup({
	spec = {
		{ "plumpalbert/nvim-basic", import = "nvim-basic.plugins" },
		{ import = "plump-typescript" },
	},
	lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
	install = { colorscheme = { "onedark", "habamax" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

vim.cmd.colorscheme("onedark")
