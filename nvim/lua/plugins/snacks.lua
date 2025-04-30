local dashboard = require('utils.snacks.dashboard.dashboard')
local keybinds = require('utils.snacks.picker.keybinds')

return {
	name = 'snacks.nvim',
	url = 'https://github.com/folke/snacks.nvim.git',
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = true },
		dashboard = dashboard,
		image = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		notify = { enabled = true },
		picker = { enabled = true },
		statuscolumn = { enabled = true },
	},
	keys = keybinds,
}
