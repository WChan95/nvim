local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 90,
  config = function(_, _)
    require("plugins.themes.catpuccin")
    vim.cmd([[colorscheme catppuccin-macchiato]])
  end,
}

return M
