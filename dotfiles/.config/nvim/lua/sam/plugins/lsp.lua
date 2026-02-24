return {
    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Diagnostic options with signs configured
            vim.diagnostic.config({
                -- virtual_text = false, -- Disable virtual text (optional)
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                    -- prefix = "icons",
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error, -- Error icon
                        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,   -- Warning icon
                        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,   -- Hint icon
                        [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,   -- Info icon
                    },
                },
                update_in_insert = true,
                severity_sort = true,
            })

            -- Key mappings for diagnostic navigation
            vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
                { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
                { noremap = true, silent = true })
            -- vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>',
            --     { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>',
                { noremap = true, silent = true })

            -- Show floating diagnostics automatically on hover
            vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                    vim.diagnostic.open_float(nil, { focusable = false })
                end,
            })
        end,
    },
}