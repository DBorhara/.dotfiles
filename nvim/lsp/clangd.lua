return {
	name = 'clangd',
	cmd = { 'clangd', '--background-index', '--clang-tidy' },
	filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
}
