return {
	name = 'noice.nvim',
	url = 'https://github.com/folke/noice.nvim.git',
	event = 'VeryLazy',
	-- add  options here
	opts = {
		lsp = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		progress = {
			progress = {
				enabled = false, -- disables LSP progress messages like "validating"
			},
			hover = {
				enabled = true, -- still allow hover docs
			},
			signature = {
				enabled = true, -- still allow signature help
			},
		},
	},
	dependencies = {
		{
			name = 'nui.nvim',
			url = 'https://github.com/MunifTanjim/nui.nvim.git',
		},
		{
			name = 'nvim-notify',
			url = 'https://github.com/rcarriga/nvim-notify.git',
		},
	},
}
