return {
	name = 'conform.nvim',
	url = 'https://github.com/stevearc/conform.nvim.git',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			python = { 'isort', 'black' },
			java = { 'google-java-format' },
		},
		default_format_opts = {
			lsp_format = 'fallback',
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = 'fallback',
		},
		formatters = {
			stylua = {
				prepend_args = {
					'--quote-style',
					'AutoPreferSingle',
					'--column-width',
					'80',
				},
			},
		},
	},
}
