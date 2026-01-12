# Adding Plugins to LazyVim Configuration

This guide explains where and how to add new plugins to your LazyVim configuration.

## Current Configuration Structure

Your nvim configuration is organized as follows:

```
~/.config/nvim/
├── init.lua
└── lua/sam/
    ├── core/
    ├── lazy.lua
    └── plugins/
        ├── init.lua
        ├── telescope.lua
        ├── nvim-tree.lua
        ├── lsp.lua
        └── ... (other plugin files)
```

## How Plugin Loading Works

Your `lazy.lua` file imports all plugins from the `sam.plugins` module:

```lua
require("lazy").setup({ import = "sam.plugins" }, {
  -- lazy configuration options
})
```

This means any `.lua` file you create in the `lua/sam/plugins/` directory will be automatically loaded by Lazy.nvim.

## Where to Add New Plugins

You have two main options for adding plugins:

### Option 1: Add to Existing Files
- **Simple plugins**: Add to `lua/sam/plugins/init.lua`
- **Related plugins**: Add to an existing relevant plugin file

### Option 2: Create Dedicated Plugin Files (Recommended)
Create a separate `.lua` file in the `lua/sam/plugins/` directory for each new plugin or group of related plugins.

## Plugin Configuration Examples

### Simple Plugin (No Configuration)

Create a new file: `lua/sam/plugins/simple-plugin.lua`

```lua
return {
  "author/plugin-name",
}
```

### Plugin with Basic Options

Create a new file: `lua/sam/plugins/configured-plugin.lua`

```lua
return {
  "author/configured-plugin",
  opts = {
    -- Plugin options here
    enable_feature = true,
    custom_setting = "value",
  },
}
```

### Plugin with Custom Configuration Function

Create a new file: `lua/sam/plugins/advanced-plugin.lua`

```lua
return {
  "author/advanced-plugin",
  config = function()
    require("advanced-plugin").setup({
      -- Custom setup configuration
      option1 = "value1",
      option2 = true,
    })
  end,
}
```

### Plugin with Dependencies and Lazy Loading

```lua
return {
  "author/main-plugin",
  dependencies = {
    "author/dependency-plugin",
  },
  event = "VeryLazy", -- Load on VeryLazy event
  cmd = "PluginCommand", -- Load when command is used
  ft = "lua", -- Load for specific filetypes
  keys = {
    { "<leader>p", "<cmd>PluginCommand<cr>", desc = "Plugin Command" },
  },
  config = function()
    require("main-plugin").setup({
      -- configuration options
    })
  end,
}
```

### Multiple Related Plugins in One File

Create a new file: `lua/sam/plugins/related-plugins.lua`

```lua
return {
  {
    "author/plugin-one",
    config = function()
      require("plugin-one").setup()
    end,
  },
  {
    "author/plugin-two",
    opts = {
      setting = "value",
    },
  },
}
```

## Best Practices

1. **Use descriptive filenames**: Name your plugin files based on the plugin's purpose (e.g., `git-tools.lua`, `markdown-support.lua`)

2. **Group related plugins**: If you have multiple plugins that serve similar purposes, put them in the same file

3. **Keep configuration organized**: For complex plugins, consider creating separate configuration functions

4. **Use lazy loading**: Optimize startup time by loading plugins only when needed using `event`, `cmd`, `ft`, or `keys`

## Example: Adding a New Plugin

Let's say you want to add the `nvim-colorizer` plugin. Create a new file:

`lua/sam/plugins/colorizer.lua`

```lua
return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      "*", -- Highlight all files
    }, {
      RGB      = true, -- #RGB hex codes
      RRGGBB   = true, -- #RRGGBB hex codes
      names    = true, -- "Name" codes like Blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      css      = true, -- Enable all CSS features
    })
  end,
}
```

After creating the file, restart Neovim or run `:Lazy sync` to install and load the new plugin.

## Managing Plugins

- **Install/Update**: `:Lazy sync`
- **View plugin status**: `:Lazy`
- **Update specific plugin**: `:Lazy update plugin-name`
- **Remove plugin**: Delete the plugin configuration and run `:Lazy clean`

## Notes

- Plugin files are loaded automatically when you restart Neovim
- You can use `:Lazy reload` to reload plugin configurations without restarting
- Check `:Lazy log` for installation and loading issues