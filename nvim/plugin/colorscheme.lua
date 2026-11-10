-- Catppuccin Mocha, shared with kitty, tmux, bat, fzf and eza.
vim.pack.add({ { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } })

require('catppuccin').setup({
    flavour = 'mocha',
    transparent_background = false,
    integrations = {
        blink_cmp = true,
        dap = true,
        dap_ui = true,
        mason = true,
        native_lsp = { enabled = true },
        render_markdown = true,
        snacks = { enabled = true },
        treesitter = true,
        lsp_trouble = true,
        which_key = true,
    },
})

vim.cmd.colorscheme('catppuccin-mocha')
