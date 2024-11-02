-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.emmet_language_server.setup({
  filetypes = {"html", "javascriptreact", "typescriptreact"}
})

lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    -- Enable completion and diagnostics
    require("cmp_nvim_lsp").setup()
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities()
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
