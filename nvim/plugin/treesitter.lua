-- nvim-treesitter (main branch): installs parsers only. Highlighting and
-- indent are enabled per buffer below with vim.treesitter.start().

-- Rebuild parsers whenever the plugin itself is updated by vim.pack.
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local data = ev.data
        if data.spec.name == 'nvim-treesitter' and data.kind == 'update' then
            if not data.active then
                vim.cmd.packadd('nvim-treesitter')
            end
            vim.cmd('TSUpdate')
        end
    end,
})

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

local parsers = {
    'bash',
    'c',
    'html',
    'java',
    'javascript',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
}

-- Only load the installer when something is actually missing (saves ~5ms
-- on every startup). Install runs async in the background.
local missing = vim.tbl_filter(function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.so', false) == 0
end, parsers)
if #missing > 0 then
    require('nvim-treesitter').install(missing)
end

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('UserTreesitter', { clear = true }),
    desc = 'Start treesitter highlighting and indent when a parser exists',
    callback = function(ev)
        if pcall(vim.treesitter.start, ev.buf) then
            vim.bo[ev.buf].indentexpr =
                "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
