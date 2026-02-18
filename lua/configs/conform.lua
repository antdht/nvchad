local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = false, -- prevent clangd from overriding
  },

  formatters = {
    clang_format = {
      prepend_args = function(self, ctx)
        local clang_format = vim.fs.find(".clang-format", {
          upward = true,
          path = ctx.dirname,
        })
        if #clang_format > 0 then
          return {}
        end
        return { [[--style={BasedOnStyle: LLVM, ColumnLimit: 0}]] }
      end,
    },
  },
}

return options
