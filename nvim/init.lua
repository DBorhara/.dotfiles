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

-------
-- LSP
-------
require('java').setup()
vim.lsp.enable({
	'luals',
	'jdtls',
	'marksman',
	'pyright',
})
require('lspconfig').jdtls.setup({})
