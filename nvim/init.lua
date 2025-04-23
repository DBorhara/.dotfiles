-------------
-- Leader Key
-------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----------
-- Imports
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
vim.lsp.enable({ 'luals', 'ltex-ls-plus', 'jdtls', 'pyright' })

-----------
-- Obsidian
-----------
vim.o.conceallevel = 2
