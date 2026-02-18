require "nvchad.mappings"
local ls = require "luasnip"

local map = vim.keymap.set

-- global lsp mappings
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Lsp prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Lsp next diagnostic" })
map("n", "<leader>,", vim.diagnostic.setloclist, { desc = "Lsp diagnostic loclist" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp Code Action" })

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

-- Trouble nvim mappings
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble Toggle diagnostics" })
map(
  "n",
  "<leader>xX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Trouble Toggle diagnostics (buffer)" }
)
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble Symbols" })
map(
  "n",
  "<leader>cl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "Trouble LSP Definitions / references / ..." }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble Location List" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble Quickfix List" })

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
