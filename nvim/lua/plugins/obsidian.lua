return {
	'obsidian-nvim/obsidian.nvim',
	version = '*',
	lazy = false,
	ft = 'markdown',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = 'CS111',
				path = '~/Documents/Obsidian/Rutgers/Rutgers_Summer_2025/CS_111',
			},
		},
		completion = {
			nvim_cmp = false,
			blink = true,
		},
		picker = {
			name = 'snacks.pick',
		},
		note_path_func = function(spec)
			-- Use the directory of the current file if available
			local current_file = vim.api.nvim_buf_get_name(0)
			local current_dir = vim.fn.fnamemodify(current_file, ':h')
			local filename = spec.title or spec.id
			return current_dir .. '/' .. filename .. '.md'
		end,
		note_id_func = function(title)
			if title ~= nil then
				return title:gsub(' ', '-'):lower()
			else
				return tostring(os.time())
			end
		end,

		note_frontmatter_func = function(note)
			return {
				id = note.id,
			}
		end,
	},
}
