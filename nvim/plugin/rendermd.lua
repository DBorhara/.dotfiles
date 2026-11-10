-- Loaded on first markdown buffer instead of at startup.
-- Icons come from nvim-web-devicons (added in lualine.lua).
vim.pack.add(
    { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
    { load = function() end }
)

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    once = true,
    callback = function()
        vim.cmd.packadd('render-markdown.nvim')
        require('render-markdown').setup({})
    end,
})
