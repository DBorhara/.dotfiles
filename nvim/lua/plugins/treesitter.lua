return {
	name = 'nvim-treesitter',
	url = 'https://github.com/nvim-treesitter/nvim-treesitter.git',
	build = ':TSUpdate',
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	init = function()
		require('nvim-treesitter.query_predicates')
	end,
	cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInsall' },
	opts_extend = { 'ensure_installed' },
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			'bash',
			'java',
			'lua',
			'markdown',
			'markdown_inline',
			'python',
		},
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)
	end,
}
