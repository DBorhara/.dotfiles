local header = require('ascii').get_random('anime', 'onepiece')
return {
    enabled = true,
    preset = {
        keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        header = table.concat(header, '\n'),
    },
    sections = {
        { section = 'header' },
        { section = 'keys',   gap = 1, padding = 1 },
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
