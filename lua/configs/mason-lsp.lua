require("mason-lspconfig").setup {
  ensure_installed = {
    "cssls",
    "clangd",
    "html",
    "hyprls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "stylua",
    "tailwindcss",
    "texlab",
    "vue_ls",
    "vtsls",
  },
  automatic_installation = true, -- ensures Mason auto-installs servers listed above
  automatic_enable = true,
}
