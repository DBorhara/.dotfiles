vim.cmd.colorscheme("vim")
vim.cmd("packadd netrw")
require("lsp")
require("keymaps")
require("options")
require("autocommands")
-- jdtls is started by nvim-jdtls in after/ftplugin/java.lua
