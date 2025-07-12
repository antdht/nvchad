require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "pyright",
    "hyprls",
    "vue_ls",
    "vtsls",
    "tailwindcss"
  },
  automatic_installation = true, -- ensures Mason auto-installs servers listed above
  automatic_enable = true,
}
