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
		opts = { variant = 'auto', transparent = false },
		config = function(_, opts)
			require('cyberdream').setup(opts)
			vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#161821' })
			vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#161821' })
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1a1c25' }) -- for floating windows

			vim.cmd('colorscheme cyberdream')
		end,
	},
}
