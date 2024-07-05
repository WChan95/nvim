local M = {
  "ray-x/go.nvim",
  dependencies = { "ray-x/guihua.lua" },
  event = "CmdLineEnter",
  ft = { "go", "gomod" },
  init = function()
    require("utils.functions").load_mappings("go")
  end,
  opts = function()
    return require("plugins.configs.lsp.ray-x-go")
  end,
  config = function(_, opts)
    require("go").setup(opts)
  end,
}

return M
