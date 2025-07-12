local default_cmp = require "nvchad.configs.cmp"

-- Your custom override for `enabled` function
local custom_cmp_opts = vim.tbl_deep_extend("force", default_cmp, {
  enabled = function()
    local context = require "cmp.config.context"
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture "comment"
        and not context.in_syntax_group "Comment"
        -- and not context.in_treesitter_capture "string.special.path"
        and not context.in_treesitter_capture "string"
    end
  end,
})

return custom_cmp_opts
