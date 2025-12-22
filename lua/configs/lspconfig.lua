-- NvChad base LSP defaults
local base = require("nvchad.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

-- -------------------------
-- Default servers
-- -------------------------
local servers = { "html", "cssls", "jsonls" }
for _, server in ipairs(servers) do
  vim.lsp.config[server] = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- -------------------------
-- TypeScript (NO formatting)
-- -------------------------
vim.lsp.config.ts_ls = {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- -------------------------
-- Biome (Formatting)
-- -------------------------
vim.lsp.config.biome = {
  cmd = { "biome", "lsp-proxy" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_markers = { "biome.json", "package.json" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "jsonc",
  },
}

----------------------------
-- Tailwind CSS (NO formatting)
-- -------------------------

vim.lsp.config.tailwindcss = {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- -------------------------
-- Enable servers
-- -------------------------
vim.lsp.enable({
  "html",
  "cssls",
  "jsonls",
  "ts_ls",
  "biome",
})
