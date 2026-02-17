return {
    -- Mason for managing LSP servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "ts_ls", "yamlls", "jsonls", "ansiblels" }, -- Add more LSP servers you need
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = {
                            version = "Lua 5.3",
                        },
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true), -- Make Neovim runtime files discoverable
                            checkThirdParty = false,                           -- Avoid popping up workspace notifications
                        },
                        telemetry = {
                            enable = false, -- Disable telemetry to avoid sending data
                        },
                        codeLens = {
                            enable = true,
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                        doc = {
                            privateName = { "^_" },
                        },
                        hint = {
                            enable = true,
                            setType = false,
                            paramType = true,
                            paramName = "Disable",
                            semicolon = "Disable",
                            arrayIndex = "Disable",
                        },
                    },
                },
            })
            --- Pyright
            vim.lsp.config('pyright', {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            pythonPath = "/opt/homebrew/bin/python3",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "basic",
                        },
                    },
                },
            })

            -- Yaml
            vim.lsp.config('yamlls', {
                capabilities = capabilities,
                settings = {
                    yaml = {
                        schemas = {
                            ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json"] = "/*ansible-playbook*.yml",
                            ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/inventory.json"] = "inventory.yml",
                            ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/all.json"] = "/*.k8s.yml",
                            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/(docker-)?compose.yml",
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.yml",
                        },
                    },
                },
            })

            -- JSON
            vim.lsp.config('jsonls', {
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = {},
                    },
                },
            })

            -- Ansible
            vim.lsp.config('ansiblels', {
                capabilities = capabilities,
            })
        end,
    }
}
