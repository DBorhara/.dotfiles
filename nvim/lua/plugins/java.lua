return {
	name = 'nvim-java',
	url = 'https://github.com/nvim-java/nvim-java.git',
	config = function()
		require('java').setup()
		vim.lsp.enable('jdtls')
	end,
}
