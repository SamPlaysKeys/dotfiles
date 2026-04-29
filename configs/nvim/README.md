# Neovim Configuration

This directory contains the Neovim configuration for the dotfiles.

## Organization

- **`init.lua`**: The main entry point for Neovim.
- **`lua/`**: The main configuration directory.
  - **`core/`**: Contains core settings like `options.lua`, `keymaps.lua`, and `autocmds.lua`.
  - **`lazy_init.lua`**: Initializes the Lazy.nvim plugin manager.
  - **`plugins/`**: Contains individual plugin configurations managed by Lazy.nvim.
- **`lazy-lock.json`**: Lockfile for Lazy.nvim plugin versions.

This setup is designed to provide a modern, IDE-like experience using LSP, Treesitter, and other modern Neovim plugins.

Some inspiration for recent additions has come from [Larvitz/nvim-ansible](https://codeberg.org/Larvitz/nvim-ansible)

---

## Treesitter Migration (April 2026)

> **Warning:** The nvim-treesitter plugin underwent a breaking API change. The `main` branch is a complete rewrite that is not backwards compatible with the old `master` branch.

### What Changed

The old API (`master` branch):
```lua
require("nvim-treesitter.configs").setup({
  ensure_installed = { ... },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = { ... },
})
```

The new API (`main` branch):
```lua
require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Highlighting now uses Neovim's built-in treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
```

### Features Removed (No Migration Path)

- **`incremental_selection`** — Use Neovim's built-in visual mode keymaps: `an` (expand to parent node), `in` (shrink to child node)
- **`autotag` integration** — nvim-ts-autotag now requires its own separate setup
- **Many other modules** — The maintainers explicitly stated: "What's in the README exists; what's not is gone without replacement"

### If You Need the Old Behavior

Pin to the `master` branch in your plugin spec:
```lua
{ "nvim-treesitter/nvim-treesitter", branch = "master" }
```

---

## Plugin Decisions

This config intentionally avoids plugin overlap. Key decisions:

| Category | Kept | Removed | Reason |
|----------|------|---------|--------|
| File explorer | nvim-tree, yazi | mini-files | nvim-tree for sidebar, yazi for full TUI |
| CSV highlighting | rainbow_csv.nvim | csvview | treesitter CSV was insufficient |
| Notifications | noice (built-in mini) | nvim-notify | noice handles it natively |
| Commenting | (native) | comment.lua | Neovim 0.10+ has built-in commenting |
| Git | gitsigns, git-blame, lazygit | — | Consolidated into `git.lua` |
| Mini plugins | surround, operators, icons | — | Consolidated into `mini.lua` |

### Key Bindings

- `<leader>gd` — Open Snacks dashboard
- `<S-Tab>` (in nvim-tree) — Show file info popup
- `an` / `in` (visual mode) — Treesitter node expand/shrink
