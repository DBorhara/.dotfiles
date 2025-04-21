return {
	name = 'lazygit.nvim',
	url = 'https://github.com/kdheepak/lazygit.nvim.git',
	lazy = true,
	cmd = {
		'LazyGit',
		'LazyGitConfig',
		'LazyGitCurrentFile',
		'LazyGitFilter',
		'LazyGitFilterCurrentFile',
	},
	-- optional for floating window border decoration
	dependencies = {
		name = 'plenary.nvim',
		url = 'https://github.com/nvim-lua/plenary.nvim.git',
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
	},
}
