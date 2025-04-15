----------------------
-- [[ Basic Keymaps ]]
----------------------
--  See `:help vim.keymap.set()`

----------------
-- Open Explorer
----------------
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

--------------
-- Source File
--------------
vim.keymap.set('n', '<leader>so', function()
  vim.cmd 'so'
end)

-------------------------------------------------
-- Delete Line Into Black Hole Register and Paste
-------------------------------------------------
vim.keymap.set('x', '<leader>p', [["_dP]])

---------------------------------------------
-- Clear Highlights On Search with Escape Key
---------------------------------------------
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

---------------------
-- Diagnostic keymaps
---------------------
vim.keymap.set('n', '<leader>qf', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

----------------------
--- Exit Terminal more
----------------------
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-------------------
-- [[ Navigation ]]
-------------------

----------------------
--- Disable Arrow Keys
----------------------
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

------------------------------
-- Page Up and Down While Centering
------------------------------
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

--------------------
--- Split Navigation
--------------------
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

---------------------------
-- [[ Basic Autocommands ]]
---------------------------
--  See `:help lua-guide-autocommands`

--------------------------
--- Highlight When Yanking
--------------------------
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
