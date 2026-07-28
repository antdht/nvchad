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

-- clangd config, more especially for cheriot
-- `cmd` is a function so the binary is chosen per client-start, against the
-- buffer's resolved project root, instead of nvim's launch-time cwd.
vim.lsp.config("clangd", {
  cmd = function(dispatchers, config)
    local root = config.root_dir or vim.fn.getcwd()
    local clangd = "clangd"
    if root:find "/home/gzeviere/Documents/Thesis/cheriot%-sim" then
      clangd = "/home/gzeviere/Documents/Thesis/cheriot-sim/sonata-software/cheriot-sdk/cheriot-llvm/bin/clangd"
    end
    return vim.lsp.rpc.start({ clangd, "--background-index", "--clang-tidy" }, dispatchers)
  end,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_markers = { ".git", "compile_commands.json", "compile_flags.txt" },
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

-- LTeX-ls-plus configuration for LaTeX
---@module "vim.lsp.client"
---@class vim.lsp.ClientConfig
vim.lsp.config("ltex_plus", {
  capabilities = lsp_defaults.capabilities,
  cmd = { "ltex-ls-plus" },
  filetypes = { "tex", "bib", "markdown", "latex" },
  root_markers = { ".git", ".latexmkrc", "texput.tex" },
  on_attach = function(client, bufnr)
    require("ltex_extra").setup {
      load_langs = { "en-GB" },
      init_check = true,
      path = vim.fn.stdpath "config" .. "/spell",
      log_level = "none",
    }
  end,
  settings = {
    ltex = {
      language = "en-GB",
      enabled = { "latex", "tex", "bib", "markdown" },
      additionalRules = {
        enablePickyRules = true,
      },
      latex = {
        commands = {
          ["\\cite{}"] = "ignore",
          ["\\ref{}"] = "ignore",
          ["\\eqref{}"] = "ignore",
          ["\\node[]"] = "ignore",
          ["\\tikz[]"] = "ignore",
          ["\\RequirePackage[]{}"] = "ignore",
          ["\\LoadClass[]{}"] = "ignore",
        },
        environments = {
          ["cheriotc"] = "ignore",
        },
      },
    },
  },
})

-- texlab configuration for LaTeX
---@module "vim.lsp.client"
---@class vim.lsp.ClientConfig
vim.lsp.config("texlab", {
  capabilities = lsp_defaults.capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_markers = { ".git", ".latexmkrc", "texput.tex" },
  settings = {
    texlab = {
      build = {
        onSave = false, -- set true if you want texlab to build on save
      },
      forwardSearch = {
        -- fill in if you use SyncTeX / a PDF viewer
      },
      -- these two make \label / \ref get inlay hints (optional but nice)
      labels = {},
    },
  },
})
