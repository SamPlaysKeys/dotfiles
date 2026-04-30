
return {
  {
    "samplayskeys/yank-filepath",
    dir = vim.fn.stdpath("config"),
    name = "yank-filepath",
    config = function()
      package.loaded["yank_filepath"] = {
        yank_filepath = function()
          local path = vim.api.nvim_buf_get_name(0)

          if path == nil or path == "" then
            vim.notify("Current buffer has no file path", vim.log.levels.WARN)
            return
          end

          vim.fn.setreg("+", path)
          vim.notify("Yanked filepath: " .. path)
        end,
      }
    end,
    keys = {
      {
        "<leader>yp",
        function()
          require("yank_filepath").yank_filepath()
        end,
        desc = "Yank current file path",
      },
    },
  },
}
