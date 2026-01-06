local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local lspconfig = require("lspconfig")
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

local servers = { "html", "cssls", "jsonls", "dockerls", "sqlls", "prismals" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

lspconfig.ts_ls.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
})

lspconfig.biome.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "json" },
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
})
