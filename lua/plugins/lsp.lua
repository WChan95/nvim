local M = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "kevinhwang91/nvim-ufo" },
      -- {
      --   "SmiteshP/nvim-navic",
      -- },
      {
        "folke/neodev.nvim",
      },
      { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
    },
    init = function()
      require("utils.functions").lazy_load("nvim-lspconfig")
    end,
    config = function()
      require("plugins.configs.lsp.lspconfig")
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = function()
      return require("plugins.configs.lsp.mason")
    end,
    config = function(_, opts)
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end, {})
      vim.g.mason_binaries_list = opts.ensure_installed
      local mr = require("mason-registry")
      local settings = require("core.settings")
      for _, tool in ipairs(settings.tools) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}

return M
