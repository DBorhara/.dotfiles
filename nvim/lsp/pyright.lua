return {
    name = 'pyright',
    cmd = { vim.fn.stdpath('data') .. '/mason/bin/pyright-langserver', '--stdio' },
    filetypes = { 'python' },
}
