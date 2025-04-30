return {
	name = 'nvim-lint',
	url = 'https://github.com/mfussenegger/nvim-lint.git',
	init = function()
		require('lint').linters_by_ft = {
			java = { 'checkstyle' },
			javascript = { 'eslint_d' },
			lua = { 'selene' },
			markdown = { 'markdownlint' },
			python = { 'pylint' },
			typescript = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
		}
	end,
}
