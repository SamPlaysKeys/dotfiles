return {
  {
    "samplayskeys/yank-filepath",
    keys = {
      {
        "<leader>yp",
        function()
          require("yank_filepath").yank_filepath()
        end,
        desc = "Yank current file path",
      },
    },
    config = function()
      require("yank_filepath").setup()
    end,
  },
}
