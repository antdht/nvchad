require("mason-lspconfig").setup {
  ensure_installed = {
    "cssls",
    "html",
    "hyprls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "vue_ls",
    "vtsls"
  },
  automatic_installation = true, -- ensures Mason auto-installs servers listed above
  automatic_enable = true,
}
