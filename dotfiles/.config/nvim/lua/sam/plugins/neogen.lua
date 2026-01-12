return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("neogen").setup({
      snippet_engine = "luasnip",
    })
    
    -- Keymap to generate annotation
    vim.keymap.set("n", "<leader>nf", function() require("neogen").generate_func_annotation() end, { desc = "Generate Function Annotation" })
    vim.keymap.set("n", "<leader>nc", function() require("neogen").generate_class_annotation() end, { desc = "Generate Class Annotation" })
    vim.keymap.set("n", "<leader>nt", function() require("neogen").generate_type_annotation() end, { desc = "Generate Type Annotation" })
  end,
  -- version = "*" 
}
