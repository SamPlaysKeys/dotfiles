-- File: lua/plugins/copilot.lua
return {
  enabled = false,
  "github/copilot.vim", -- Official GitHub Copilot plugin
  event = "InsertEnter", -- Load only when entering insert mode
  config = function()
    -- Optional: Disable Copilot for certain filetypes
    vim.g.copilot_filetypes = {
      ["TelescopePrompt"] = false,
      ["markdown"] = true, -- enable for markdown
      [""] = false,        -- disable for empty filetype
    }

    -- Optional: Map <C-J> to accept Copilot suggestion
    vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

    -- Optional: Disable default tab mapping so it doesn't conflict with completion
    vim.g.copilot_no_tab_map = true
  end,
}
