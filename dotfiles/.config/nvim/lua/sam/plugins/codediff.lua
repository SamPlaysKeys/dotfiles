return {
  "esmuellert/codediff.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("codediff").setup({
        -- You can add custom configuration here if needed
    })
    
    -- Keymaps for codediff
    vim.keymap.set("v", "<leader>cd", "<cmd>CodeDiff<cr>", { desc = "Compare selected code blocks" })
  end,
}
