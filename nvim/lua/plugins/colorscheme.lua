return {
	{
		url = 'https://github.com/bluz71/vim-moonfly-colors.git',
		name = 'moonfly',
		lazy = false,
		priority = 1000,
	},
	{
		url = 'https://github.com/folke/tokyonight.nvim',
		name = 'tokyonight',
	},
	{
		url = 'https://github.com/rose-pine/neovim',
		name = 'rose-pine',
	},
	{
		url = 'https://github.com/scottmckendry/cyberdream.nvim',
		name = 'cyberdream',
		config = function()
			require('cyberdream').setup({
				variant = 'default',
				transparent = false,
				saturation = 1,
			})
		end,
	},
}
