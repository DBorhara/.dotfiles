vim.api.nvim_create_user_command('LSPInfo', function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	if vim.tbl_isempty(clients) then
		print('No LSP client is currenly running.')
		return
	end

	for _, client in pairs(clients) do
		vim.cmd.checkhealth('vim.lsp')
	end
end, {})
