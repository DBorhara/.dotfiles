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

vim.lsp.enable({ 'luals', 'jdtls', 'pyright' })
