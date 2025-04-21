local header = require('ascii').get_random('anime', 'onepiece')
local keys = require('utils.snacks.dashboard.keys')

return {
	enabled = true,
	preset = {
		keys = keys,
		header = table.concat(header, '\n'),
	},
	sections = {
		{ section = 'header' },
		{ section = 'keys', gap = 0, padding = 1 },
		{ section = 'startup' },
		function()
			local in_git = Snacks.git.get_root() ~= nil
			local cmds = {
				{
					title = 'Git Graph',
					icon = ' ',
					cmd = [[echo -e "$(git-graph --style round --color always --wrap 50 0 8 -f 'oneline')"]],
					indent = 1,
					height = 35,
				},
			}
			return vim.tbl_map(function(cmd)
				return vim.tbl_extend('force', {
					pane = 2,
					section = 'terminal',
					enabled = function()
						return in_git and vim.o.columns > 130
					end,
					padding = 1,
					-- ttl = 5 * 60,
				}, cmd)
			end, cmds)
		end,
	},
}
