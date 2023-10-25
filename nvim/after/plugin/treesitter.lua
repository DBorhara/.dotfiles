local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "javascript",
        "markdown",
        "markdown_inline",
        "go",
        "html",
        "json",
        "lua",
        "query",
        "regex",
        "rust",
        "ruby",
        "scss",
        "typescript",
        "vim",
        "vimdoc",
        "zig"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
