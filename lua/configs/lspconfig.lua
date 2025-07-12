require("nvchad.configs.lspconfig").defaults()

local lsp_defaults = require "nvchad.configs.lspconfig"

-- lsps with default config
vim.lsp.config("*", {
  on_attach = lsp_defaults.on_attach,
  on_init = lsp_defaults.on_init,
  capabilities = lsp_defaults.capabilities,
})

-- Vue stuff
local vue_language_server_path = vim.fn.expand "$MASON/packages"
  .. "/vue-language-server"
  .. "/node_modules/@vue/language-server"
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
vim.lsp.config("vue_ls", {
  on_init = function(client)
    client.handlers["tsserver/request"] = function(_, result, context)
      local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = "vtsls" }
      if #clients == 0 then
        vim.notify("Could not found `vtsls` lsp client, vue_lsp would not work without it.", vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = table.unpack(result)
      local id, command, payload = table.unpack(param)
      ts_client:exec_cmd({
        title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
        command = "typescript.tsserverRequest",
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
        local response_data = { { id, r.body } }
        ---@diagnostic disable-next-line: param-type-mismatch
        client:notify("tsserver/response", response_data)
      end)
    end
  end,
})

vim.lsp.config("vtsls", {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { "vue", "ts", "js", "jsx", "tsx" },
})
