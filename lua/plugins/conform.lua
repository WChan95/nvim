local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  cmd = { "ConformInfo" },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    require("utils.functions").load_mappings("conform")
  end,
  -- TODO: Define mason install dependencies
  opts = {
    -- Define your formatters
    -- prefer toml and rc files
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "yapf" },
      javascript = { { "prettierd", "prettier" } },
      cs = { "csharpier" },
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      formatters = {
        csharpier = {
          commands = "dotnet-csharpier",
          args = { "--write-stdout" },
        },
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}

return M
