local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    js = { "prettier" },
    javascriptreact = { "prettier" },
    jsx = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    tsx = { "prettier" },
    c = { "clang_format" },
    json = { "prettier" },
    -- php = { "pint" },
    php = { "intelephense" },
    blade = { "blade-formatter" },
    yaml = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1500,
    -- lsp_fallback = true,
  },
}

return options
