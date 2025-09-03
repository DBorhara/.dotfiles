-- Make sure you're on obsidian-nvim/obsidian.nvim and have it set up.
-- In your setup you can also turn off legacy commands:
-- require("obsidian").setup({ legacy_commands = false })

vim.api.nvim_create_autocmd('User', {
	pattern = 'ObsidianNoteEnter',
	callback = function(ev)
		local ok, obs = pcall(require, 'obsidian')
		if not ok then
			return
		end

		-- Smart <CR>: follow link / toggle checkbox / jump tag / fold heading
		-- (You can skip this; the plugin maps <CR> by default. This is how to set it explicitly.)
		vim.keymap.set('n', '<CR>', obs.keymaps.smart_action, {
			buffer = ev.buf,
			desc = 'Obsidian smart action',
		})

		-- Toggle checkbox
		vim.keymap.set('n', '<leader>ch', '<cmd>Obsidian toggle_checkbox<CR>', {
			buffer = ev.buf,
			desc = 'Toggle Obsidian checkbox',
		})

		-- Smart gf: the plugin already handles gf on links with pass-through behavior.
		-- If you want to force it here anyway:
		vim.keymap.set('n', 'gf', '<cmd>Obsidian follow_link<CR>', {
			buffer = ev.buf,
			desc = 'Follow Obsidian link',
		})
	end,
})
