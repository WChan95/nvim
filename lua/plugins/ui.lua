local M = {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false, -- stops invalid window id error
    config = function(_, _)
      require("nvim-web-devicons").setup({})
    end,
  },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end,
  },

  {
    "rcarriga/nvim-notify", -- nvim-notify for noice and notifications
    init = function()
      require("utils.functions").load_mappings("notify")
    end,
    opts = function()
      return require("plugins.configs.ui.nvim-notify").options
    end,
    config = function(_, opts)
      require("notify").setup(opts)
      require("plugins.configs.ui.nvim-notify").setNotify()
      require("plugins.configs.ui.nvim-notify").print_override()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
      return require("plugins.configs.ui.noice_opts")
    end,
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return require("plugins.configs.ui.lualine_opts")
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("utils.functions").load_mappings("nvimtree")
    end,
    opts = function()
      return require("plugins.configs.ui.nvimtree")
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
      vim.g.nvimtree_side = opts.view.side
    end,
  },
  {
    -- Shows lines as it relates to code indents (vertical lines)
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      return require("plugins.configs.ui.indent-blankline")
    end,
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
  },
}

return M
