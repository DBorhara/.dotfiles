local lint = require('lint')

vim.api.nvim_create_autocmd('BufEnter', {
	callback = function()
		lint.try_lint()
	end,
})
