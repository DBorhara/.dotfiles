return {
	'obsidian-nvim/obsidian.nvim',
	version = '*',
	lazy = false,
	ft = 'markdown',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		workspaces = {
			{
				name = 'CS111',
				path = '~/Documents/Obsidian/Rutgers/Rutgers_Summer_2025/CS_111/',
			},
		},
		completion = {
			nvim_cmp = false,
			blink = true,
		},
		picker = {
			name = 'snacks.pick',
		},
		mappings = {},
	},
}
