vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "E[x]ecute current lua line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "E[x]ecute current lua line" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction'})
vim.keymap.set('n', '<C-n>', '<cmd>tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<Tab>', '<cmd>tabnext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<S-Tab>', '<cmd>tabprev<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

require("lazy").setup({
  { import = "plugins" }
})

