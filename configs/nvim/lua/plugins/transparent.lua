-- Transparent background plugin
-- https://github.com/xiyaowong/transparent.nvim

return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- Load immediately to prevent flicker on startup
  keys = {
    { "<leader>uT", "<cmd>TransparentToggle<CR>", desc = "Toggle Transparency" },
  },
}
