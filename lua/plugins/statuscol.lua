local M = {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  config = function(_, opts)
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = true,
      --so basically, the segment is literally the order of how things are gonna get built
      -- so to disable the fold line numbers just literally init the segment and comment out the fold part
      --
      segments = {
        -- { text = { "%C" }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
      },
    })
  end,
}

return M
