return {
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
	{
		'<leader>fb',
		function()
			Snacks.picker.buffers()
		end,
		desc = 'Buffers',
	},
}
