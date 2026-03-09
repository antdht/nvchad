vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

vim.opt_local.wrap = true
vim.opt_local.linebreak = true

vim.opt_local.spell = false
vim.opt_local.spelllang = { "en_gb" }

local map = vim.keymap.set

-- Move by visual line (handle wrapped lines)
map({ "n", "v" }, "<Down>", "gj", { desc = "Move down visually" })
map({ "n", "v" }, "<Up>", "gk", { desc = "Move up visually" })

-- Do the same for j and k keys (standard vim navigation)
map({ "n", "v" }, "j", "gj", { desc = "Move down visually" })
map({ "n", "v" }, "k", "gk", { desc = "Move up visually" })
