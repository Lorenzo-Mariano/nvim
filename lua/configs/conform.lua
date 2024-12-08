local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    tsx = { "prettier" },
    jsx = { "prettier" },
    c = { "clang_format" },
    json = { "prettier" },
    php = { "pint" },
    yaml = { "prettier" }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
