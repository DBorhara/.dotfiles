--------------------
--- Setting options
--------------------
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

--------------------------
--- Place Title in Wezterm
--------------------------
if vim.env.WEZTERM_ACTIVE then
	vim.o.title = true
	vim.o.titlestring = 'nvim: %t'
end

----------------
--- Line Numbers
----------------
vim.opt.number = true

-------------------------
--- Relative Line Numbers
-------------------------
vim.opt.relativenumber = true

--------------
--- Mouse Mode
--------------
vim.opt.mouse = 'a'

-----------------------------
--- Hide Default Mode Showing
-----------------------------
vim.opt.showmode = false

------------------------------
--- Sync OS and NVIM Clipboard
------------------------------
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

---------------------------------------
--- Enable Indentation of Wrapped Lines
---------------------------------------
vim.opt.breakindent = true

---------------------
--- Save Undo History
---------------------
vim.opt.undofile = true

-----------------------------------------------------------------------------------------
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
-----------------------------------------------------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true

---------------
--- Sign Column
---------------
vim.opt.signcolumn = 'yes'

-------------------------
--- Decrease Update Time
------------------------
vim.opt.updatetime = 250

--------------------------------------
--- Decrease Mapped Sequence Wait Time
--------------------------------------
vim.opt.timeoutlen = 300

------------------------------------------
--- Vertical and Horizontal Split Opening
-----------------------------------------
vim.opt.splitright = true
vim.opt.splitbelow = true

-------------------------------------
--- Display of Whitespace Characters
------------------------------------
--  See `:help 'list'`
vim.opt.list = true
--  and `:help 'listchars'`
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

------------------------------
--- Live Substitution Preview
-----------------------------
vim.opt.inccommand = 'split'

-----------------------
--- Curse Line Location
-----------------------
vim.opt.cursorline = true

-----------------------------------------------
--- Minimal Screen Lines Above and Below Curser
-----------------------------------------------
vim.opt.scrolloff = 10

------------------------
--- Confirmation Dialoug
------------------------
-- See `:help 'confirm'`
vim.opt.confirm = true

-- vim: ts=2 sts=2 sw=2 et
