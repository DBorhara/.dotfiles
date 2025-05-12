return {
	name = 'Harpoon2',
	url = 'https://github.com/ThePrimeagen/harpoon.git',
	branch = 'harpoon2',
	dependencies = {
		name = 'plenary.nvim',
		url = 'https://github.com/nvim-lua/plenary.nvim.git',
	},
	config = function()
		local harpoon = require('harpoon')

		harpoon:setup()

		vim.keymap.set('n', '<leader>a', function()
			harpoon:list():add()
		end)

		vim.keymap.set('n', '<C-e>', function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set('n', '<C-h>', function()
			harpoon:list():select(1)
		end)

		vim.keymap.set('n', '<C-t>', function()
			harpoon:list():select(2)
		end)

		vim.keymap.set('n', '<C-n>', function()
			harpoon:list():select(3)
		end)

		vim.keymap.set('n', '<C-s>', function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set('n', '<C-,<', function()
			harpoon:list():prev()
		end)

		vim.keymap.set('n', '<C-.>', function()
			harpoon:list():next()
		end)
	end,
}
