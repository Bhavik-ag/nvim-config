require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "biome", "ts_ls", "jsonls", "tailwindcss", "dockerls", "sqlls", "prismals" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
