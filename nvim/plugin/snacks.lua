local dashboard = require("utils.snacks.dashboard.dashboard")
local keybinds = require("utils.snacks.picker.keybinds")

vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
    animate = { enabled = true },
    dashboard = dashboard,
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    notify = { enabled = true },
    picker = { enabled = true },
    statuscolumn = { enabled = true },
})

for _, map in ipairs(keybinds) do
    local lhs = map[1]
    local rhs = map[2]
    local opts = { desc = map.desc, silent = true }
    vim.keymap.set("n", lhs, rhs, opts)
end
