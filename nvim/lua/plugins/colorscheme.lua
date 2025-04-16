-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     config = function()
--         vim.cmd("colorscheme rose-pine")
--     end
-- }

return {
	url = 'https://github.com/bluz71/vim-moonfly-colors.git',
	name = 'moonfly',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd('colorscheme moonfly')
	end,
}
