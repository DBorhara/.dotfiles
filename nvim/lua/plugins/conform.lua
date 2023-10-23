return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            ["javascript"] = { { "prettierd", "prettier" } },
            ["javascriptreact"] = { { "prettierd", "prettier" } },
            ["typescript"] = { { "prettierd", "prettier" } },
            ["typescriptreact"] = { { "prettierd", "prettier" } },
            ["go"] = { { "goimports-reviser", "goimports" } },
            ["css"] = { { "prettierd", "prettier" } },
            ["scss"] = { { "prettierd", "prettier" } },
            ["bash"] = { "beautysh" },
            ["html"] = { { "prettierd", "prettier" } },
            ["json"] = { { "prettierd", "prettier" } },
            ["jsonc"] = { { "prettierd", "prettier" } },
            ["yaml"] = { { "prettierd", "prettier" } },
            ["markdown"] = { { "prettierd", "prettier" } },
            ["markdown.mdx"] = { { "prettierd", "prettier" } },
            ["graphql"] = { { "prettierd", "prettier" } },
            ["lua"] = { "stylelua" },
        },
    },
}
