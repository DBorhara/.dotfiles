vim.pack.add {
  { src = 'https://github.com/stevearc/conform.nvim' }
}

require("conform").setup({
  formatters_by_ft = {
    c = { 'clang-format' },
    java = { 'google-java-format' },
    lua = { 'stylua' },
    markdown = { 'cbfmt', 'prettierd' },
    css = { 'prettierd' },
    sql = { 'pg_format' },
    xml = { 'xmlformatter' },
    make = { 'mbake' },
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters = {
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
