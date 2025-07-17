local lint = require('lint')
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
	callback = function()
		lint.try_lint()
	end,
})
