vim.pack.add({ 'https://github.com/MaximilianLloyd/ascii.nvim' })

require('ascii').setup({
    dependencies = {
        name = 'nui.nvim',
        url = 'https://github.com/MunifTanjim/nui.nvim.git',
    },
})
