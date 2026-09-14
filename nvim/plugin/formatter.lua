vim.pack.add {
  { src = 'https://github.com/stevearc/conform.nvim' }
}

require("conform").setup({
  formatters_by_ft = {
    c = { 'clang-format' },
    java = { 'google-java-format' },
    lua = { 'stylua' },
    markdown = { 'cbfmt', 'prettierd' },
    ocaml = { 'ocamlformat' },
    css = { 'prettierd' },
    sql = { 'pg_format' },
    xml = { 'xmlformatter' },
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters = {
    ocamlformat = {
      prepend_args = {
        "--if-then-else",
        "vertical",
        "--break-cases",
        "fit-or-vertical",
        "--type-decl",
        "sparse",
      },
    },

    stylua = {
      prepend_args = {
        '--quote-style',
        'AutoPreferSingle',
        '--column-width',
        '80',
      },
    },
  },
})
