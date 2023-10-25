local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
        lua = { "stylua" },
        go = { "goimports-reviser" },
        bash = { "beautysh" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },
})
