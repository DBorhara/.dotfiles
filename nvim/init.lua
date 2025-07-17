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
vim.lsp.enable({
	'luals',
	'jdtls',
	'marksman',
	'pyright',
	'typescript-language-server',
})
vim.diagnostic.config({
	update_in_insert = false, -- don't show diagnostics while typing
	severity_sort = true, -- sort by severity
	virtual_text = true, -- you can tweak this or set to false to hide inline errors
})

-----------
-- Obsidian
-----------
vim.opt.conceallevel = 2
