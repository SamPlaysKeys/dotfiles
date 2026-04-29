return {
  "voldikss/vim-floaterm",
  cmd = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev" },
  keys = {
    { "<leader>et", "<cmd>FloatermToggle<cr>", desc = "Toggle Floaterm" },
    -- { "<leader>en", "<cmd>FloatermNew<cr>", desc = "New Floaterm" },
  },
  init = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_title = "Terminal"
    -- Close floaterm when the process exits
    vim.g.floaterm_autoclose = 1
  end,
}
