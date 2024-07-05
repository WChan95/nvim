local M = {
  "kevinhwang91/nvim-ufo",
  lazy = true,
  dependencies = { "kevinhwang91/promise-async" },
  init = function()
    require("utils.functions").load_mappings("ufo")
  end,
  opts = {
    provider_selector = function(bufnr, filetype)
      return { "lsp", "treesitter", "indent" }
    end,
  },
  config = function(_, opts)
    require("ufo").setup(opts)
  end,
}
return M
