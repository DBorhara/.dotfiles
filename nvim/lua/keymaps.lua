-----------
-- Navigation
-------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Explorer' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'scroll up and center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'scroll down and center' })
-- Ctrl-h/j/k/l: move between Neovim windows; at the edge, hand off to the
-- neighbouring tmux pane (tmux side lives in tmux/tmux.conf).
local tmux_dir = { h = 'L', j = 'D', k = 'U', l = 'R' }
local names = { h = 'left', j = 'lower', k = 'upper', l = 'right' }
for key, flag in pairs(tmux_dir) do
    vim.keymap.set('n', '<C-' .. key .. '>', function()
        local win = vim.api.nvim_get_current_win()
        vim.cmd.wincmd(key)
        if vim.env.TMUX and win == vim.api.nvim_get_current_win() then
            vim.system({ 'tmux', 'select-pane', '-' .. flag })
        end
    end, { desc = 'Move focus to the ' .. names[key] .. ' window / tmux pane' })
end
vim.keymap.set('n', '<Esc>', '<CMD>nohlsearch<CR>')

-----------
-- Commands
-----------
vim.cmd('command! Q q')
vim.keymap.set('n', '<leader>to', '<CMD>vsplit | terminal<CR>', { desc = "Open split terminal" })

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
    require('conform').format({
        async = true,
        lsp_format = 'fallback',
    })
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
