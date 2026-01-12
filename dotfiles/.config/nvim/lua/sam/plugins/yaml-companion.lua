return {
  "someone-stole-my-name/yaml-companion.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("yaml_schema")
    
    local cfg = require("yaml-companion").setup({
      -- Builtin matchers
      builtin_matchers = {
        kubernetes = { enabled = true },
        cloud_init = { enabled = true }
      },
      
      -- Schemas
      schemas = {
        {
          name = "OpenShift 4.14",
          uri = "https://raw.githubusercontent.com/garethr/openshift-json-schema/master/v4.14.0-standalone-strict/all.json",
        },
        {
          name = "Ansible Playbook",
          uri = "https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json",
        },
      },
      
      lspconfig = {
        settings = {
          yaml = {
            validate = true,
            schemaStore = {
              enable = false,
              url = "",
            },
          },
        },
      },
    })
    
    -- Use the new Neovim 0.11 API instead of require("lspconfig")["yamlls"].setup(cfg)
    vim.lsp.config("yamlls", cfg)
    vim.lsp.enable("yamlls")
  end,
}