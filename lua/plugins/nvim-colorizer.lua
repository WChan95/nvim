local M = {
  "norcalli/nvim-colorizer.lua",
  config = function(_, _)
    require("colorizer").setup()
  end,
}
return M
