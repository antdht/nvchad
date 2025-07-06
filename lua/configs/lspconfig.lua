require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "hyprls" }
vim.lsp.enable(servers)
