local M = {}
local function trim_empty_lines(lines)
	while #lines > 0 and lines[1]:match('^%s*$') do
		table.remove(lines, 1)
	end
	while #lines > 0 and lines[#lines]:match('^%s*$') do
		table.remove(lines, #lines)
	end
	return lines
end

function M.hover_in_split()
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(
		0,
		'textDocument/hover',
		params,
		function(_, result, _, _)
			if not (result and result.contents) then
				vim.notify('No hover info', vim.log.levels.INFO)
				return
			end

			local markdown_lines =
				vim.lsp.util.convert_input_to_markdown_lines(result.contents)

			markdown_lines = trim_empty_lines(markdown_lines)

			if vim.tbl_isempty(markdown_lines) then
				vim.notify('No hover content', vim.log.levels.INFO)
				return
			end

			vim.cmd('vsplit') -- you could also use 'split' or 'new'
			local buf = vim.api.nvim_get_current_buf()
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, markdown_lines)

			-- Buffer options
			vim.bo[buf].buftype = 'nofile'
			vim.bo[buf].bufhidden = 'wipe'
			vim.bo[buf].swapfile = false
			vim.bo[buf].modifiable = false
			vim.bo[buf].filetype = 'markdown'

			vim.api.nvim_buf_set_name(buf, '[LSP Hover]')
		end
	)
end

return M
