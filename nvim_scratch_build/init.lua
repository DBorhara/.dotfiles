------------------
--- Leader Keymap
------------------
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----------------------
--- Enable Nerd Fonts
----------------------
vim.g.have_nerd_font = true

--------------------
--- Setting Options
--------------------
require 'options'

------------------
--- Basic Keymaps
------------------
require 'keymaps'

--------------------------------
--- Install lazy plugin manager
--------------------------------
require 'lazy-bootstrap'

----------------------------------
--- Configure and Install Plugins
----------------------------------
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
