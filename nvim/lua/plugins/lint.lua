return {
	name = 'nvim-lint',
	url = 'https://github.com/mfussenegger/nvim-lint.git',
	init = function()
		require('lint').linters_by_ft = {
			java = { 'checkstyle' },
			lua = { 'selene' },
			markdown = { 'markdownlint' },
			python = { 'pylint' },
		}
	end,
}
