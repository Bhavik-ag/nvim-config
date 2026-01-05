require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("html", {})
vim.lsp.config("cssls", {})
vim.lsp.config("biome", { filetypes = { "javascript", "typescript", "json" } })
vim.lsp.config("ts_ls", { filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" } })
vim.lsp.config("jsonls", { filetypes = { "json", "jsonc" } })
vim.lsp.config("tailwindcss", { filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx" } })
vim.lsp.config("dockerls", { filetypes = { "dockerfile" } })
vim.lsp.config("sqlls", { filetypes = { "sql" } })
vim.lsp.config("prismals", { filetypes = { "prisma" } })

vim.lsp.enable({ "html", "cssls", "biome", "ts_ls", "jsonls", "tailwindcss", "dockerls", "sqlls", "prismals" })
