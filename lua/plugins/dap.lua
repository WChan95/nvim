local M = {
  -- Debugger functionality
  "mfussenegger/nvim-dap",
  init = function()
    require("utils.functions").load_mappings("dap")
  end,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
      init = function()
        require("utils.functions").load_mappings("dap_ui")
      end,
      opts = function()
        return require("plugins.configs.dap.ui")
      end,
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
      end,
    },
    {
      "mfussenegger/nvim-dap-python",
      config = function(_, _)
        require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
      end,
    },
    {
      "leoluz/nvim-dap-go",
      config = function(_, _)
        require("dap-go").setup()
      end,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,
        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},
        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          "python",
          "delve",
          -- Update this to ensure that you have the debuggers for the langs you want
        },
      },
    },
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function(_, _)
    local icons = require("utils.lazyvim-icons")
    for name, sign in pairs(icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
  end,
}

return M
