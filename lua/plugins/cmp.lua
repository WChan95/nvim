---@diagnostic disable: different-requires

local M = {
  "hrsh7th/nvim-cmp",
  event = {"InsertEnter", "CmdlineEnter"},
  dependencies = {
     "L3MON4D3/LuaSnip" 
      "windwp/nvim-autopairs", -- autopairing of (){}[] etc
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "lukas-reineke/cmp-rg",
  },
  config = function(_, _)
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    require("cmp").setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 60,
          ellipsis_char = "...",
        }),
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      sources = {
        { name = "nvim_lsp" },
        -- { name = "nvim_lsp_signature_help" }, -- this currently conflcit with noice signature help
        -- keyword_length so we stop getting every single crap under the sun
        { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "rg", keyword_length = 5 },
      },
    })
  end,
}

return M
