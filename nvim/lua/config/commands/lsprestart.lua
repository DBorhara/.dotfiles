vim.api.nvim_create_user_command('LSPRestart', function()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	if vim.tbl_isempty(clients) then
		print('No LSP client to restart.')
		return
	end

	for _, client in pairs(clients) do
		vim.lsp.stop_client(client.id)
	end

	vim.defer_fn(function()
		vim.cmd('edit') -- triggers BufRead which usually auto-starts the LSP again
		print('LSP client restarted.')
	end, 100)
end, {})
