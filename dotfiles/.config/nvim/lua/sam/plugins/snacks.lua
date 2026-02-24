return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- init = function()
  --   vim. api.nvim_create_autocmd( "ColorScheme", {
  --   pattern ="*",
  --   callback = function()
  --   vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#cc0000" })
  --   end,
  --   })
  --   vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#cc0000" })
  --   end,
  opts = {
    -- Enables the better `vim.ui.input`
    input = { enabled = true },
    -- Enables the better `vim.ui.select` (via picker module)
    picker = {
      enabled = true,
      ui_select = true, -- Replaces `vim.ui.select`
    },
    -- Provides vertical indentation guides
    indent = {
      enabled = true,
      char = "┊",
    },
    -- Highlights the block of code your cursor is currently inside
    scope = { enabled = true },
    -- Toggle system for various settings
    toggle = { enabled = true },
    -- Dashboard configuration replacing alpha.nvim
    dashboard = {
      enabled = true,
      preset = {
        header = [[
 ██████████               ███████████ █████                  ███████████ █████       ███                     
▒▒███▒▒▒▒███             ▒█▒▒▒███▒▒▒█▒▒███                  ▒█▒▒▒███▒▒▒█▒▒███       ▒▒▒                      
 ▒███   ▒▒███  ██████    ▒   ▒███  ▒  ▒███████    ██████    ▒   ▒███  ▒  ▒███████   ████  ████████    ███████
 ▒███    ▒███ ███▒▒███       ▒███     ▒███▒▒███  ███▒▒███       ▒███     ▒███▒▒███ ▒▒███ ▒▒███▒▒███  ███▒▒███
 ▒███    ▒███▒███ ▒███       ▒███     ▒███ ▒███ ▒███████        ▒███     ▒███ ▒███  ▒███  ▒███ ▒███ ▒███ ▒███
 ▒███    ███ ▒███ ▒███       ▒███     ▒███ ▒███ ▒███▒▒▒         ▒███     ▒███ ▒███  ▒███  ▒███ ▒███ ▒███ ▒███
 ██████████  ▒▒██████        █████    ████ █████▒▒██████        █████    ████ █████ █████ ████ █████▒▒███████
▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒        ▒▒▒▒▒    ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒        ▒▒▒▒▒    ▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒███
                                                                                                     ███ ▒███
                                                                                                    ▒▒██████ 
                                                                                                     ▒▒▒▒▒▒  
        ]],
        keys = {
          { icon = " ", key = "e", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "t", desc = "Toggle file explorer", action = ":NvimTreeToggle" },
          { icon = "󰱼 ", key = "f", desc = "Find File", action = ":Telescope find_files" },
          { icon = " ", key = "s", desc = "Find Word", action = ":Telescope live_grep" },
          { icon = "󰁯 ", key = "r", desc = "Restore Session", action = ":SessionRestore" },
          { icon = "󰒲 ", key = "l", desc = "Lazy Plugins", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit NVIM", action = ":qa" },
        },
      },
    },
  },
  keys = {
    { "<leader>uw", function() Snacks.toggle.option("list"):toggle() end, desc = "Toggle Whitespace (listchars)" },
  },
}
