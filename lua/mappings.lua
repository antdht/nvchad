require "nvchad.mappings"
local ls = require "luasnip"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "<leader>q", "<cmd>q<cr>", { desc = "quit" })
map("i", "<C-BS>", "<C-w>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>")
map("i", "<S-Tab>", "<C-d>", {})

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Navigation with TmuxNavigate
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate Left" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate Down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate Up" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate Right" })

-- LazyGit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit Show LazyGit" })

-- Notifications
map("n", "<leader>fn", function()
  require("telescope").extensions.notify.notify()
end, { desc = "Telescope Show notifications" })

-- Ui
vim.keymap.set("n", "<leader>h", function()
  require("minty.huefy").open()
end, { desc = "UI Call Huefy" })
vim.keymap.set("n", "<leader>s", function()
  require("minty.shades").open()
end, { desc = "UI Call Shades" })

-- Luasnip
map({ "i", "s" }, "jk", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, { silent = true, desc = "Luasnip jump to next context" })

map({ "i", "s" }, "kj", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, desc = "Luasnip jump to previous context" })
