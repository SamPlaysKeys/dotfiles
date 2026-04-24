-- Git Plugin Collection
--
-- This file consolidates git-related plugins:
--   - gitsigns.nvim: Git signs in the gutter, hunk navigation, staging
--   - git-blame.nvim: Inline git blame annotations
--   - lazygit.nvim: Terminal UI for git (lazygit integration)

return {
  -----------------------------------------------------------------------------
  -- gitsigns.nvim: Git integration for buffers
  -- Shows added/changed/removed lines in the sign column.
  -- Keybindings:
  --   ]h / [h       : Navigate to next/prev hunk
  --   <leader>hs/hr : Stage/reset hunk
  --   <leader>hS/hR : Stage/reset buffer
  --   <leader>hu    : Undo stage hunk
  --   <leader>hp    : Preview hunk
  --   <leader>hb    : Blame line (full)
  --   <leader>hB    : Toggle line blame
  --   <leader>hd/hD : Diff this / Diff this ~
  --   ih            : Text object for hunk (visual/operator)
  -----------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage hunk")
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset hunk")

        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

        map("n", "<leader>hd", gs.diffthis, "Diff this")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff this ~")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
      end,
    },
  },

  -----------------------------------------------------------------------------
  -- git-blame.nvim: Show git blame info inline
  -- Commands:
  --   :Blame / :blame   : Toggle git blame annotations
  --   :GitBlameToggle   : Toggle git blame annotations (original command)
  -----------------------------------------------------------------------------
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    config = function()
      vim.api.nvim_create_user_command("Blame", "GitBlameToggle", { desc = "Toggle Git Blame" })
      vim.cmd([[cabbrev <expr> blame (getcmdtype() == ':' && getcmdline() ==# 'blame') ? 'Blame' : 'blame']])
    end,
  },

  -----------------------------------------------------------------------------
  -- lazygit.nvim: Full terminal UI for git
  -- Opens lazygit in a floating terminal window.
  -- Keybindings:
  --   <leader>lg : Open LazyGit
  --   <leader>gi : Open LazyGit (alias)
  -- Commands:
  --   :LazyGit, :LazyGitCurrentFile, :LazyGitFilter, etc.
  -----------------------------------------------------------------------------
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
      { "<leader>gi", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    },
  },
}
