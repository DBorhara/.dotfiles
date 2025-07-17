vim.api.nvim_create_autocmd('FileType', {
	pattern = 'markdown',
	callback = function(args)
		local ok, obsidian = pcall(require, 'obsidian')
		if not ok then
			return
		end

		-- Smart <CR>: follow link or toggle checkbox
		vim.keymap.set('n', '<CR>', function()
			return obsidian.util.smart_action()
		end, {
			buffer = args.buf,
			desc = 'Obsidian smart action (link/checkbox)',
			expr = true,
		})

		-- Toggle checkbox with <leader>ch
		vim.keymap.set('n', '<leader>ch', function()
			obsidian.util.toggle_checkbox()
		end, {
			buffer = args.buf,
			desc = 'Toggle Obsidian checkbox',
		})

		-- Smart gf: follow link or fall back
		vim.keymap.set('n', 'gf', function()
			if obsidian.util.cursor_on_markdown_link() then
				vim.cmd('ObsidianFollowLink')
			else
				vim.cmd('normal! gf')
			end
		end, {
			buffer = args.buf,
			desc = 'Smart gf (Obsidian-aware)',
		})
	end,
})
