-- Set the leader key to space
vim.g.mapleader = " "

-- Quickly save with <leader>w
vim.keymap.set("n", "<leader>w", ":w<CR>")

--  n normal mode, when pressing leader followed by 'pv', execute the Ex command mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode, when pressing 'J', move the selected block one line down and reselect it
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- In visual mode, when pressing 'K', move the selected block one line up and reselect it
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode, when pressing 'J', join the current line with the next and return to the starting position
vim.keymap.set("n", "J", "mzJ`z")

-- In normal mode, when pressing Ctrl+d, move half a screen down and center the cursor line
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- In normal mode, when pressing Ctrl+u, move half a screen up and center the cursor line
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- In normal mode, when pressing 'n', find the next match of the last search and center the cursor line
vim.keymap.set("n", "n", "nzzzv")

-- In normal mode, when pressing 'N', find the previous match of the last search and center the cursor line
vim.keymap.set("n", "N", "Nzzzv")

-- In visual mode, when pressing leader followed by 'p', delete the selected text and paste before the cursor
vim.keymap.set("x", "<leader>p", [["_dP]])

-- In both normal and visual mode, when pressing leader followed by 'y', yank the selection to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- In normal mode, when pressing leader followed by 'Y', yank the line to the system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- In both normal and visual mode, when pressing leader followed by 'd', delete the selection without storing it in a register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- In insert mode, when pressing Ctrl+c, exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- In normal mode, when pressing 'Q', disable its default functionality (entering Ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- In normal mode, when pressing Ctrl+f, execute an external shell command 'tmux neww tmux-sessionizer'
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- In normal mode, when pressing leader followed by 'f', format the buffer using the lsp format function
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- In normal mode, go to the next compile error/warning and center the cursor line
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- In normal mode, go to the previous compile error/warning and center the cursor line
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- In normal mode, go to the next linting error/warning and center the cursor line
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- In normal mode, go to the previous linting error/warning and center the cursor line
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- In normal mode, prepare a substitution of the word under the cursor with a placeholder for replacement
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- In normal mode, make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- In normal mode, source the current vim configuration (this seems to be incomplete, and might not work as expected)
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
