-- Combined layout plugins

return {
  -----------------------------------------------------------------------------
  -- NOTE: aerial.nvim: Code outline/navigation
  -----------------------------------------------------------------------------
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("aerial").setup({
        layout = {
          default_direction = "right",
          resize_to_content = true,
          preserve_equality = false,
          placement = "window",
        },
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>ea", "<cmd>AerialToggle!<CR>")
  
    end,
  },

  -----------------------------------------------------------------------------
  -- NOTE: bufferline.nvim: Tab Bar
  -----------------------------------------------------------------------------
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        mode = "tabs",
        separator_style = "slant",
      },
    },
  },

  -----------------------------------------------------------------------------
  -- NOTE: vim-floaterm: Floating Terminal
  -----------------------------------------------------------------------------
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev" },
    keys = {
      { "<leader>et", "<cmd>FloatermToggle<cr>", desc = "Toggle Floaterm" },
      -- { "<leader>en", "<cmd>FloatermNew<cr>", desc = "New Floaterm" },
    },
    init = function()
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_title = "Terminal"
      -- Close floaterm when the process exits
      vim.g.floaterm_autoclose = 1
      -- Do not automatically switch to terminal mode
      vim.g.floaterm_autoinsert = false
    end,
  },

  -----------------------------------------------------------------------------
  -- NOTE: lualine.nvim: Status Line
  -----------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status")
      -- to configure lazy pending updates count
  
      local colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        red = "#FF4A4A",
        orange = "#FF9E64",
        semilightgray = "#8b95a7",
        fg = "#c3ccdc",
        bg = "#112638",
        inactive_bg = "#2c3043",
      }
  
      local branch_bg = "#45475a"
      local branch_fg = "#cdd6f4"
  
      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
          b = { bg = branch_bg, fg = branch_fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = branch_bg, fg = branch_fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
          b = { bg = branch_bg, fg = branch_fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = branch_bg, fg = branch_fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = branch_bg, fg = branch_fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        terminal = {
          a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
          b = { bg = branch_bg, fg = branch_fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
          b = { bg = colors.inactive_bg, fg = colors.semilightgray },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }
  
      -- Shortened mode names
      local mode_map = {
        ["NORMAL"] = "NOR",
        ["INSERT"] = "INS",
        ["VISUAL"] = "VIS",
        ["V-LINE"] = "V-L",
        ["V-BLOCK"] = "V-B",
        ["SELECT"] = "SEL",
        ["S-LINE"] = "S-L",
        ["S-BLOCK"] = "S-B",
        ["REPLACE"] = "REP",
        ["V-REPLACE"] = "V-R",
        ["COMMAND"] = "CMD",
        ["EX"] = "EX",
        ["MORE"] = "MOR",
        ["CONFIRM"] = "CON",
        ["SHELL"] = "SH",
        ["TERMINAL"] = "TER",
      }
  
      -- configure lualine with modified theme
      lualine.setup({
        options = {
          theme = my_lualine_theme,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return mode_map[str] or str
              end,
            },
          },
          lualine_b = {
            {
              "filename",
              path = 4, -- 0=filename, 1=relative path, 2=absolute, 3=absolute with ~, 4=filename and parent dir
            },
          },
          lualine_c = {
            { "diff" },
          },
          lualine_x = {
            { "filetype" },
            { "diagnostics" },
          },
          lualine_y = {},
          lualine_z = { "branch" },
        },
        extensions = { "lazy" },
      })
    end,
  },

  -----------------------------------------------------------------------------
  -- NOTE: noice.nvim: Enhanced UI
  -----------------------------------------------------------------------------
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  -----------------------------------------------------------------------------
  -- NOTE: snacks.nvim: UI Enhancements Collection
  -----------------------------------------------------------------------------
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
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
            { icon = "⚙︎ ", key = "t", desc = "Launch the Terminal", action = ":terminal" },
            { icon = "󰱼 ", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = " ", key = "s", desc = "Find Word", action = ":Telescope live_grep" },
            { icon = "󰁯 ", key = "r", desc = "Restore Session", action = ":SessionRestore" },
            { icon = "󰒲 ", key = "l", desc = "Lazy Plugins", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit NVIM", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { title = "Keymaps", section = "keys", gap = 1, indent = 2, padding = 1 },
          { title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { title = "Projects", section = "projects", indent = 2, padding = 2 },
          { section = "startup" },
        },
      },
    },
    keys = {
      { "<leader>uw", function() Snacks.toggle.option("list"):toggle() end, desc = "Toggle Whitespace (listchars)" },
      { "<leader>gd", function() Snacks.dashboard() end, desc = "Dashboard" },
    },
  },

  -----------------------------------------------------------------------------
  -- NOTE: which-key.nvim: Keybinding Helper
  -----------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
