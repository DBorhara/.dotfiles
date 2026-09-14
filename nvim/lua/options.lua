-----------------
-- Neovim Options
------------------
local opt = vim.opt

--------------------
-- Interface
--------------------
opt.colorcolumn = '80'        -- Line length marker at 80 columns
opt.confirm = true            -- Save Insurance
opt.cursorline = true         -- Hightlight cursor line
opt.fillchars = { eob = " " } -- hide "~" on empty lines
opt.foldmethod = 'marker'     -- Enable folding (default 'foldmarker')
opt.ignorecase = true         -- Ignore case letters when search
opt.laststatus = 3            -- Set global statusline
opt.linebreak = true          -- Wrap on word boundary
opt.number = true             -- Show line number
opt.rnu = true                -- Use relative line numbers
opt.showmatch = true          -- Highlight matching parenthesis
opt.smartcase = true          -- Ignore lowercase for the whole pattern
opt.splitbelow = true         -- Horizontal split to the bottom
opt.splitright = true         -- Vertical split to the right
opt.termguicolors = true      -- Enable 24-bit RGB colors
opt.showmode = false          -- Hide commands at bottom
opt.signcolumn = 'auto'       -- Keep signcolumn on

-----------
-- Spacing
-----------
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 4     -- Shift 4 spaces when tab
opt.smartindent = true -- Autoindent new lines
opt.tabstop = 4        -- 1 tab == 4 spaces

---------------
-- Performance
---------------
opt.inccommand = 'split' --Live substitutions while typing
opt.updatetime = 250     -- Decrease update time

----------------
-- Miscellaneous
----------------
-- Use OS cipboard as yank/paste/delete buffer
vim.schedule(function()
    opt.clipboard = 'unnamedplus'
end)

-- Save undo history
opt.undofile = true
