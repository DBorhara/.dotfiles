-----------
-- Navigation
-------------
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Explorer' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'scroll up and center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'scroll down and center' })
vim.keymap.set(
	'n',
	'<C-h>',
	'<C-w><C-h>',
	{ desc = 'Move focus to the left window' }
)
vim.keymap.set(
	'n',
	'<C-l>',
	'<C-w><C-l>',
	{ desc = 'Move focus to the right window' }
)
vim.keymap.set(
	'n',
	'<C-j>',
	'<C-w><C-j>',
	{ desc = 'Move focus to the lower window' }
)
vim.keymap.set(
	'n',
	'<C-k>',
	'<C-w><C-k>',
	{ desc = 'Move focus to the upper window' }
)
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

----------
-- Editing
----------
vim.keymap.set('n', '<leader>mj', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<leader>mk', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set(
	'v',
	'<leader>mj',
	":m '>+1<CR>gv=gv",
	{ desc = 'Move Line Down in Visual Mode' }
)
vim.keymap.set(
	'v',
	'<leader>mk',
	":m '<-2<CR>gv=gv",
	{ desc = 'Move Line Up in Visual Mode' }
)
vim.keymap.set('n', '<left>', '<CMD>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<CMD>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<CMD>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<CMD>echo "Use j to move!!"<CR>')

-------
-- LSP
-------
-- Format Buffer
vim.keymap.set('n', '<leader>/', function()
	--vim.lsp.buf.format({ bufnr = 0, async = true, timeout_ms = 1000 })
	require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'Format buffer' })
-- Inline Diagnostics
vim.keymap.set('n', '<leader>td', function()
	local current = vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = not current })
	print('Diagnostics virtual text: ' .. (not current and 'ON' or 'OFF'))
end, { desc = 'Toggle diagnostics virtual text' })

--------------------------
-- Diagnostics via Trouble
--------------------------
vim.keymap.set(
	'n',
	'<leader>xx',
	'<CMD>Trouble diagnostics toggle<CR>',
	{ desc = 'Trouble Diagnostics' }
)
vim.keymap.set(
	'n',
	'<leader>xl',
	'<CMD>Trouble loclist toggle<CR>',
	{ desc = 'Trouble Location List' }
)
vim.keymap.set(
	'n',
	'<leader>xb',
	'<CMD>Trouble diagnostics toggle filter.buf=0<CR>',
	{ desc = 'Trouble Buffer Diagnoistics' }
)
vim.keymap.set(
	'n',
	'<leader>xq',
	'<CMD>Trouble qflist toggle<CR>',
	{ desc = 'Trouble Quickfix List' }
)
vim.keymap.set(
	'n',
	'<leader>xd',
	'<CMD>Trouble lsp toggle focus=false win.position=right<CR>',
	{ desc = 'Trouble - LSP Definitions / references / ' }
)
vim.keymap.set(
	'n',
	'<leader>xs',
	'<CMD>Trouble symbols toggle focus=false<CR>',
	{ desc = 'Trouble Symbol List' }
)
