-- Most VimTeX mappings rely on localleader and this can be changed with the
-- following line. The default is usually fine and is the symbol "\".

-- vim.g.vimtex_view_method = "mupdf"
vim.g.vimtex_view_method = "zathura"
vim.g["vimtex_quickfix_mode"] = 1

vim.g.vimtex_quickfix_ignore_filters = {
  "Package lipsum Warning",
  "Overfull",
  "Marginpar",
  "Package minted Warning",
  "Draft mode on.",
  "Latex Warning: Reference",
}

vim.g.vimtex_syntax_custom_envs = {
  {
    name = "cheriotc",
    region = "texCheriotcZone",
    nested = "cpp",
  },
}

-- init = function()
--   -- VimTeX configuration goes here, e.g.
--   vim.g.vimtex_view_method = "mupdf"
--   vim.g["vimtex_quickfix_mode"] = 1
--   vim.g.maplocalleader = "\\"
--   vim.g["vimtex_log_ignore"] = { -- Error suppression:
--     "Underfull",
--     "Overfull",
--     "specifier changed to",
--     "Token not allowed in a PDF string",
--     "Package caption Warning: The option `hypcap=true' will be ignored",
--   }
-- end,
