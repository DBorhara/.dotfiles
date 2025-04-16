local M = {}

function M.hover_in_split()
	local params = vim.lsp.util.make_position_params()
	vim.lsp.buf_request(
		0,
		'textDocument/hover',
		params,
		function(_, result, ctx, _)
			if not (result and result.contents) then
				print('No hover info')
				return
			end

			local lines = vim.lsp.util._trim(
				vim.lsp.util.convert_input_to_markdown_lines(result.contents)
			)

			if vim.tbl_isempty(lines) then
				print('No hover content')
				return
			end

			vim.cmd('vnew')
			local buf = vim.api.nvim_get_current_buf()
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			vim.bo[buf].buftype = 'nofile'
			vim.bo[buf].bufhidden = 'wipe'
			vim.bo[buf].swapfile = false
			vim.bo[buf].filetype = 'markdown'
			vim.api.nvim_buf_set_name(buf, '[LSP Hover]')
		end
	)
end

return M
