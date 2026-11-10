-- Sessions per project folder: open files and splits are saved when you
-- quit, and restored with `s` on the dashboard or <leader>qs.
vim.pack.add({ 'https://github.com/folke/persistence.nvim' })

require('persistence').setup({})

local map = vim.keymap.set
map('n', '<leader>qs', function() require('persistence').load() end,
    { desc = 'Restore session for this folder' })
map('n', '<leader>qS', function() require('persistence').select() end,
    { desc = 'Pick a session to restore' })
map('n', '<leader>ql', function() require('persistence').load({ last = true }) end,
    { desc = 'Restore last session' })
map('n', '<leader>qd', function() require('persistence').stop() end,
    { desc = "Don't save this session on exit" })
