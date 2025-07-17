return {
	name = 'jdtls',
	cmd = { vim.fn.stdpath('data') .. '/mason/bin/jdtls', '--stdio' },
	filetypes = { 'java' },
	flags = { debounce_text_changes = 500 },
}
