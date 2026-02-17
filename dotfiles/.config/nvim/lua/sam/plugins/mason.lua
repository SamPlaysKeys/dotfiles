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
                ensure_installed = { "lua_ls", "pyright", "taplo", "ts_ls", "yamlls", "jsonls", "ansiblels", "powershell_es", "helm_ls", "jinja_lsp" },
            })

            -- Lua
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.3" },
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                        codeLens = { enable = true },
                        completion = { callSnippet = "Replace" },
                        doc = { privateName = { "^_" } },
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
            vim.lsp.enable('lua_ls')

            -- Pyright
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
            vim.lsp.enable('pyright')

            -- JSON
            vim.filetype.add({ extension = { hujson = "json5" } })
            vim.lsp.config('jsonls', {
                capabilities = capabilities,
                filetypes = { "json", "jsonc", "json5" },
                settings = {
                    json = { schemas = {} },
                },
            })
            vim.lsp.enable('jsonls')

            -- Ansible
            vim.lsp.config('ansiblels', {
                capabilities = capabilities,
                settings = {
                    ansible = {
                        ansible = { path = "ansible" },
                        executionEnvironment = { enabled = false },
                        python = { interpreterPath = "python3" },
                        validation = {
                            enabled = true,
                            lint = { enabled = true, path = "ansible-lint" },
                        },
                    },
                },
            })
            vim.lsp.enable('ansiblels')

            -- Helm
            vim.lsp.config('helm_ls', {
                capabilities = capabilities,
                settings = {
                    ['helm-ls'] = {
                        yamlls = { path = "yaml-language-server" }
                    }
                }
            })
            vim.lsp.enable('helm_ls')

            -- Taplo (TOML)
            vim.lsp.config('taplo', {
                capabilities = capabilities,
                settings = {
                    taplo = {
                        config = { root_dir = { ".git", "*.toml" } }
                    }
                },
            })
            vim.lsp.enable('taplo')

            -- TypeScript (ts_ls)
            vim.lsp.config('ts_ls', { capabilities = capabilities })
            vim.lsp.enable('ts_ls')

            -- PowerShell
            vim.lsp.config('powershell_es', { capabilities = capabilities })
            vim.lsp.enable('powershell_es')
            
            -- Jinja2
            vim.filetype.add({ extension = { jinja = "htmldjango", jinja2 = "htmldjango", j2 = "htmldjango" } })
            vim.lsp.config('jinja_lsp', {
                capabilities = capabilities,
                filetypes = { "htmldjango" },
            })
            vim.lsp.enable('jinja_lsp')

            -- Yaml: Configured in plugins/yaml-companion.lua
        end,
    }
}
