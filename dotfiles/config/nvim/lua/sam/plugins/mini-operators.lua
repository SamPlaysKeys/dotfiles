return {
  "echasnovski/mini.operators",
  version = false,
  config = function()
    require("mini.operators").setup({
      -- Evaluate text and replace with output
      evaluate = {
        prefix = "g=",
        func = nil,
      },

      -- Exchange text regions
      exchange = {
        prefix = "gx",
        reindent_linewise = true,
      },

      -- Multiply (duplicate) text
      multiply = {
        prefix = "gm",
        func = nil,
      },

      -- Replace text with register
      replace = {
        prefix = "gr",
        reindent_linewise = true,
      },

      -- Sort text
      sort = {
        prefix = "gs",
        func = nil,
      },
    })
  end,
}