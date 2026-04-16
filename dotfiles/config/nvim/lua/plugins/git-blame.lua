return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    -- The plugin automatically sets up its own commands like :GitBlameToggle
    
    -- Create a custom command :Blame that calls :GitBlameToggle
    vim.api.nvim_create_user_command("Blame", "GitBlameToggle", { desc = "Toggle Git Blame" })
    
    -- Command-line abbreviation to allow lowercase ':blame'
    vim.cmd([[cabbrev <expr> blame (getcmdtype() == ':' && getcmdline() ==# 'blame') ? 'Blame' : 'blame']])
  end,
}
