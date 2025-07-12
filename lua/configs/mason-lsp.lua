require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "pyright",
    "hyprls",
    "vue_ls",
    "vtsls",
  },
  automatic_installation = true, -- ensures Mason auto-installs servers listed above
}
