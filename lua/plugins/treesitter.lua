local settings = require("core.settings")

local M = {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    require("utils.functions").lazy_load("nvim-treesitter")
  end,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = {
    autotag = { enable = true },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    ensure_installed = {
      settings.treesitter_ensure_installed,
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.tsx.filettpe_to_parsername = { "javascript", "typescript.tsx" }
  end,
}

return M
