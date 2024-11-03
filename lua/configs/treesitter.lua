local config = require "nvim-treesitter.configs"
local parsers = require("nvim-treesitter.parsers").get_parser_configs()

config.setup {
  highlight = {
    enable = true,
  },
}

parsers.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "blade",
}

vim.filetype.add {
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
}
