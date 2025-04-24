return {
	name = 'ltex-ls-plus',
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/ltex-ls-plus',
		'--server-type=StandardStream',
	},
	filetypes = { 'markdown' },
}
