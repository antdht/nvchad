require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Lua snippets location
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"

vim.filetype.add {
  extension = { rasi = "rasi" },
  pattern = {
    [".*/waybar/config"] = "jsonc",
    [".*/kitty/*.conf"] = "bash",
    [".*/hypr/*.conf"] = "hyprlang",
  },
}
