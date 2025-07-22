return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    local statusline = require('mini.statusline')
    statusline.setup({ use_icons = vim.g.have_nerd_font })
  end
}

