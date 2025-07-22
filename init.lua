vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.shiftwidth = 2
--vim.opt.runtimepath:append("/home/victor/.local/share/nvim/site/parser")

vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

require("lazy").setup({
  { import = "plugins" }
})

