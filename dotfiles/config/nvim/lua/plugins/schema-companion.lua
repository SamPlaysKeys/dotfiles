return {
  "cenk1cenk2/schema-companion.nvim",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("schema-companion").setup({
      log_level = vim.log.levels.INFO,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    -- Yaml LS
    vim.lsp.config("yamlls", require("schema-companion").setup_client(
      require("schema-companion").adapters.yamlls.setup({
        sources = {
          require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
          require("schema-companion").sources.lsp.setup(),
          require("schema-companion").sources.schemas.setup({
            {
              name = "OpenShift 4.14",
              uri = "https://raw.githubusercontent.com/garethr/openshift-json-schema/master/v4.14.0-standalone-strict/all.json",
            },
            {
              name = "Ansible Playbook",
              uri = "https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json",
            },
          }),
        },
      }),
      {
        capabilities = capabilities,
        settings = {
          yaml = {
            validate = true,
            schemaStore = {
              enable = false,
              url = "",
            },
          },
        },
      }
    ))
    vim.lsp.enable("yamlls")

    -- Helm LS
    vim.lsp.config("helm_ls", require("schema-companion").setup_client(
      require("schema-companion").adapters.helmls.setup({
        sources = {
          require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
          require("schema-companion").sources.lsp.setup(),
        },
      }),
      {
        capabilities = capabilities,
        settings = {
          ['helm-ls'] = {
            yamlls = { path = "yaml-language-server" }
          }
        }
      }
    ))
    vim.lsp.enable("helm_ls")

    -- JSON LS
    vim.filetype.add({ extension = { hujson = "json5" } })
    vim.lsp.config("jsonls", require("schema-companion").setup_client(
      require("schema-companion").adapters.jsonls.setup({
        sources = {
          require("schema-companion").sources.lsp.setup(),
          require("schema-companion").sources.none.setup(),
        },
      }),
      {
        capabilities = capabilities,
        filetypes = { "json", "jsonc", "json5" },
        settings = {
          json = { schemas = {} },
        },
      }
    ))
    vim.lsp.enable("jsonls")

    -- Taplo (TOML) LS
    vim.lsp.config("taplo", require("schema-companion").setup_client(
      require("schema-companion").adapters.taplo.setup({
        sources = {
          require("schema-companion").sources.lsp.setup(),
          require("schema-companion").sources.none.setup(),
        },
      }),
      {
        capabilities = capabilities,
        settings = {
          taplo = {
            config = { root_dir = { ".git", "*.toml" } }
          }
        },
      }
    ))
    vim.lsp.enable("taplo")
  end,
}