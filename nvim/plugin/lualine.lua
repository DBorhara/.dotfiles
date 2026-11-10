vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require("lualine").setup({
    options = {
        theme = 'catppuccin-mocha',
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
