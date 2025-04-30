-- create (or clear) an augroup and keep its ID
local bufcheck_grp = vim.api.nvim_create_augroup('bufcheck', { clear = true })

vim.api.nvim_create_autocmd('BufReadPost', {
	group = bufcheck_grp,
	pattern = '*',
	callback = function()
		-- get the last cursor pos mark
		local last_line = vim.fn.line('\'"')
		if last_line > 0 and last_line <= vim.fn.line('$') then
			-- restore the position
			vim.fn.setpos('.', vim.fn.getpos('\'"'))
			-- center the cursor
			vim.cmd('silent! normal! zz')
			-- open any folds under the cursor
			vim.cmd('silent! normal! zv')
		end
	end,
})
