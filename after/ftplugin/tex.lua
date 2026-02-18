local map = vim.keymap.set

vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_gb", "fr" }

-- Quickly correct the last misspelled word
map("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = false, buffer = true })
