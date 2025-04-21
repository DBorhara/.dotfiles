return {
	name = 'noice.nvim',
	url = 'https://github.com/folke/noice.nvim.git',
	event = 'VeryLazy',
	opts = {
		-- add any options here
	},
	dependencies = {
		{
			name = 'nui.nvim',
			url = 'https://github.com/MunifTanjim/nui.nvim.git',
		},
		{
			name = 'nvim-notify',
			url = 'https://github.com/rcarriga/nvim-notify.git',
		},
	},
}
