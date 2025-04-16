local dashboard = require('ui.dashboard')
return {
	name = 'snacks.nvim',
	url = 'https://github.com/folke/snacks.nvim.git',
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = true },
		dashboard = dashboard,
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		notify = { enabled = true },
		picker = { enabled = true },
		statuscolumn = { enabled = true },
	},
	keys = {
		{
			'<leader><space>',
			function()
				Snacks.picker.smart()
			end,
			desc = 'Smart Find Files',
		},
		{
			'<leader>ff',
			function()
				Snacks.picker.files()
			end,
			desc = 'Find Files',
		},
		{
			'<leader>fg',
			function()
				Snacks.picker.grep()
			end,
			desc = 'Grep',
		},
		{
			'<leader>fc',
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
			end,
			desc = 'Find Config File',
		},
		{
			'<leader>sH',
			function()
				Snacks.picker.help()
			end,
			desc = 'Help Pages',
		},
		{
			'<leader>sM',
			function()
				Snacks.picker.man()
			end,
			desc = 'Man Pages',
		},
		{
			'<leader>sK',
			function()
				Snacks.picker.keymaps()
			end,
			desc = 'Keymaps',
		},
		{
			'<leader>sC',
			function()
				Snacks.picker.colorschemes()
			end,
			desc = 'Colorschemes',
		},
	},
}
