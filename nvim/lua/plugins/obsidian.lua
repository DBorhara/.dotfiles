return {
	name = 'obsidian.nvim',
	url = 'https://github.com/obsidian-nvim/obsidian.nvim.git',
	version = '*',
	lazy = true,
	ft = 'markdown',
	dependencies = {
		name = 'plenary.nvim',
		url = 'https://github.com/nvim-lua/plenary.nvim.git',
	},
	opts = {
		completion = {
			blink = true,
			nvim_cmp = false,
		},
		workspaces = {
			{
				name = 'Rutgers Spring 2025',
				path = '~/Documents/Obsidian/Rutgers/Rutgers Spring 2025/',
			},
			{ name = 'JavaDocs', path = '~/Documents/Obsidian/JavaDocs/' },
			{
				name = 'Rutgers CS',
				path = '~/Documents/Obsidian/Rutgers/Rutgers Comp Sci BS/',
			},
		},
		conceallevel = 1,
		ui = {
			conceallevel = 1,
		},
	},
}
