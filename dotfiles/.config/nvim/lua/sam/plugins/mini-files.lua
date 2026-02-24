return {
  "echasnovski/mini.files",
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 40,
    },
    options = {
      use_as_default_explorer = false,
    },
  },
  keys = {
    {
      "<leader>ef",
      function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local path = (vim.bo.buftype == "" and buf_name ~= "") and buf_name or vim.uv.cwd()
        require("mini.files").open(path, true)
      end,
      desc = "Open mini.files (dir of current file)",
    },
    {
      "<leader>ec",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
}
