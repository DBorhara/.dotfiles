vim.api.nvim_create_autocmd('BufEnter', {
	callback = function(args)
		local uv = vim.uv
		local buf_path =
			---@diagnostic disable-next-line: undefined-field
			uv.fs_realpath(vim.api.nvim_buf_get_name(args.buf) or '')
		---@diagnostic disable-next-line: undefined-field
		local config_real = uv.fs_realpath(vim.fn.expand('~/.config/nvim'))

		if buf_path and config_real and buf_path:find(config_real) == 1 then
			vim.cmd('lcd ' .. config_real)
		end
	end,
})
