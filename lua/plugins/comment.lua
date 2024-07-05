local M = {
  -- Comments out blocks of code
  "numToStr/Comment.nvim",
  init = function()
    require("utils.functions").load_mappings("comment")
  end,
  config = function()
    require("Comment").setup()
  end,
}

return M
