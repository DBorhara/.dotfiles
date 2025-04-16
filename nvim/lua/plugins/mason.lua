return {
	name = 'mason.nvim',
	url = 'https://github.com/williamboman/mason.nvim.git',
	config = function()
		require('mason').setup()
	end,
}
