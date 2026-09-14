vim.pack.add({ 'https://github.com/prichrd/netrw.nvim' })

require('netrw').setup({
    dependencies = {
        name = 'mini.icons',
        url = 'https://github.com/echasnovski/mini.icons',
        version = '*',
    },
    opts = {
        use_devicons = true,
    },
})
