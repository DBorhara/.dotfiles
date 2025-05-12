return {
	name = 'mason.nvim',
	url = 'https://github.com/williamboman/mason.nvim.git',
	config = function()
		require('mason').setup({
			ui = {
				icons = {
					package_installed = '✓',
					package_pending = '➜',
					package_uninstalled = '✗',
				},
			},
		})
	end,
}
