require("nvchad.configs.lspconfig").defaults()

local lsp_defaults = require "nvchad.configs.lspconfig"

-- lsps with default config
vim.lsp.config("*", {
  on_attach = lsp_defaults.on_attach,
  on_init = lsp_defaults.on_init,
  capabilities = lsp_defaults.capabilities,
})

-- Vue stuff
---@module "vim.lsp.client"
---@class vim.lsp.ClientConfig
vim.lsp.config("vue_ls", {
  on_init = function(client)
    client.handlers["tsserver/request"] = function(_, result, context)
      local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = "vtsls" }
      if #clients == 0 then
        vim.notify("Could not find `vtsls` lsp client, vue_lsp will not work without it!", vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)
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
  settings = {
    typescript = {
      inlayHints = {
        enumMemberValues = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        parameterTypes = {
          enabled = true,
          suppressWhenArgumentMatchesName = true,
        },
        variableTypes = {
          enabled = true,
        },
      },
    },
  },
})

---@module "vim.lsp.client"
---@class vim.lsp.ClientConfig
vim.lsp.config("vtsls", {
  filetypes = { "vue", "javascript", "typescript" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.expand "$MASON/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
            configNamespace = "typescript",
          },
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "vue" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
