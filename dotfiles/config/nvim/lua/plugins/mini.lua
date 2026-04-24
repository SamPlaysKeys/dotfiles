-- Mini.nvim Plugin Collection
--
-- This file consolidates several mini.nvim modules:
--   - mini.icons: File icons (mocks nvim-web-devicons for compatibility)
--   - mini.operators: Text operators (evaluate, exchange, multiply, replace, sort)
--   - mini.surround: Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- All modules are from https://github.com/echasnovski/mini.nvim

return {
  -----------------------------------------------------------------------------
  -- mini.icons: Lightweight icon provider
  -- Mocks nvim-web-devicons so plugins expecting that API work seamlessly.
  -----------------------------------------------------------------------------
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -----------------------------------------------------------------------------
  -- mini.operators: Text operators that work with motions
  -- Keybindings:
  --   g= : Evaluate text and replace with output
  --   gx : Exchange text regions
  --   gm : Multiply (duplicate) text
  --   gr : Replace text with register
  --   gs : Sort text
  -----------------------------------------------------------------------------
  {
    "echasnovski/mini.operators",
    version = false,
    config = function()
      require("mini.operators").setup({
        evaluate = {
          prefix = "g=",
          func = nil,
        },
        exchange = {
          prefix = "gx",
          reindent_linewise = true,
        },
        multiply = {
          prefix = "gm",
          func = nil,
        },
        replace = {
          prefix = "gr",
          reindent_linewise = true,
        },
        sort = {
          prefix = "gs",
          func = nil,
        },
      })
    end,
  },

  -----------------------------------------------------------------------------
  -- mini.surround: Surround text with brackets, quotes, tags, etc.
  -- Keybindings:
  --   sa : Add surrounding (e.g., saiw" to surround word with quotes)
  --   sd : Delete surrounding
  --   sr : Replace surrounding
  --   sf : Find surrounding (to the right)
  --   sF : Find surrounding (to the left)
  --   sh : Highlight surrounding
  --   sn : Update n_lines search range
  -----------------------------------------------------------------------------
  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup({
        custom_surroundings = nil,
        highlight_duration = 500,
        mappings = {
          add = "sa",
          delete = "sd",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          replace = "sr",
          update_n_lines = "sn",
          suffix_last = "l",
          suffix_next = "n",
        },
        n_lines = 20,
        respect_selection_type = false,
        search_method = "cover",
        silent = false,
      })
    end,
  },
}
