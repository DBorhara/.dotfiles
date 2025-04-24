-----------------
-- Neovim Options
------------------
local opt = vim.opt

--------------------
-- Interface
--------------------
opt.number = true -- Show line number
opt.rnu = true -- Use relative line numbers
opt.cursorline = true -- Hightlight cursor line
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80' -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.confirm = true -- Save Insurance
opt.showmode = false -- Hide commands at bottom
opt.signcolumn = 'yes' -- Keep signcolumn on

-----------
-- Spacing
-----------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

---------------
-- Performance
---------------
opt.updatetime = 250 -- Decrease update time
opt.inccommand = 'split' --Live substitutions while typing

----------------
-- Miscellaneous
----------------
-- Use OS cipboard as yank/paste/delete buffer
vim.schedule(function()
	opt.clipboard = 'unnamedplus'
end)

-- Save undo history
opt.undofile = true
