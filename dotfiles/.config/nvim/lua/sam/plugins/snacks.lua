return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Enables the better `vim.ui.input`
    input = { enabled = true },
    -- Enables the better `vim.ui.select` (via picker module)
    picker = {
      enabled = true,
      ui_select = true, -- Replaces `vim.ui.select`
    },
    -- Provides vertical indentation guides
    indent = {
      enabled = true,
      char = "┊",
    },
    -- Highlights the block of code your cursor is currently inside
    scope = { enabled = true },
    -- Toggle system for various settings
    toggle = { enabled = true },
  },
  keys = {
    { "<leader>uw", function() Snacks.toggle.option("list"):toggle() end, desc = "Toggle Whitespace (listchars)" },
  },
}