return {
	name = 'lualine.nvim',
	url = 'https://github.com/nvim-lualine/lualine.nvim.git',
	dependencies = {
		name = 'nvim-web-devicons',
		url = 'https://github.com/nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('lualine').setup({
			options = {
				theme = {
					normal = {
						a = { bg = '#31748f', fg = '#e0def4', gui = 'bold' }, -- blue bg, brighter fg
						b = { bg = '#1f1d2e', fg = '#31748f' },
						c = { bg = '#1f1d2e', fg = '#e0def4' },
					},
					insert = {
						a = { bg = '#00ff88', fg = '#1f1d2e', gui = 'bold' }, -- neon green pops on dark
					},
					visual = {
						a = { bg = '#eb6f92', fg = '#1f1d2e', gui = 'bold' }, -- soft pink + dark fg
					},
					replace = {
						a = { bg = '#e0def4', fg = '#1f1d2e', gui = 'bold' }, -- flipped for high contrast
					},
					inactive = {
						a = { bg = '#1f1d2e', fg = '#524f67' },
						b = { bg = '#1f1d2e', fg = '#524f67' },
						c = { bg = '#1f1d2e', fg = '#524f67' },
					},
				},
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				globalstatus = true,
				icons_enabled = true,
			},
			sections = {
				lualine_a = { { 'mode', icon = '' } },
				lualine_b = {
					{ 'branch', icon = '' },
					'diff',
					'diagnostics',
				},
				lualine_c = {
					{
						'filename',
						path = 1,
						symbols = {
							modified = '●',
							readonly = '',
							unnamed = '[No Name]',
						},
					},
				},
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then
								return '󰅚 No LSP'
							end
							local names = {}
							for _, client in pairs(clients) do
								table.insert(names, client.name)
							end
							return table.concat(names, ', ')
						end,
						icon = '',
					},
					'encoding',
					'fileformat',
					'filetype',
				},
				lualine_y = { 'progress' },
				lualine_z = { { 'location', icon = '' } },
			},
		})
	end,
}
