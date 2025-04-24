return {
	'kawre/leetcode.nvim',
	build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
	},
	opts = {
		-- configuration goes here
		picker = { provider = 'snacks.picker' },
	},
}
