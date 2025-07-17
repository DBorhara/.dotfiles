return {
	name = 'marksman',
	cmd = { vim.fn.stdpath('data') .. '/mason/bin/marksman' },
	filetypes = { 'markdown' },
	flags = { debounce_text_changes = 500 },
}
