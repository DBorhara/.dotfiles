return {
	name = 'typescript-language-server',
	cmd = {
		vim.fn.stdpath('data') .. '/mason/bin/typescript-language-server',
		'--stdio',
	},
	filetypes = {
		'javascript',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
}
