-------------
-- Leader Key
-------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----------
-- Imports Keep In Order For Loading
----------
require('config.lazy')
require('config.remap')
require('config.options')
require('config.commands')

------------
-- Nerd Font
------------
vim.g.have_nerd_font = true

vim.opt.termguicolors = true
vim.cmd('colorscheme moonfly')

-------
-- LSP
-------
vim.lsp.enable({
	'luals',
	'jdtls',
	'marksman',
	'pyright',
})
