return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {},
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "mason.nvim",
            "mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
        },

        config = function()
            local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            local capabilities = has_cmp and cmp_nvim_lsp.default_capabilities()
                or vim.lsp.protocol.make_client_capabilities()

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            end

            local defaults = {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            local servers = {
                "cssls",
                "tailwindcss",
                "ts_ls",
                "intelephense",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config[server] = defaults
                vim.lsp.enable(server)
            end

            vim.lsp.config["lua_ls"] = vim.tbl_deep_extend("force", defaults, {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                            disable = { "lowercase-global" }
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
                                [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                                [vim.fn.expand("${3rd}/love2d/library")] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 10000,
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.config["html"] = {
                capabilities = capabilities,
                filetypes = { "html", "php", "blade", "vue" },
            }
            vim.lsp.enable("html")

            -- vim.lsp.config["phpactor"] = vim.tbl_deep_extend("force", defaults, {
            --     init_options = {
            --         ["language_server_phpstan.enabled"] = false,
            --         ["language_server_psalm.enabled"] = false,
            --     },
            --     filetypes = { "php", "html", "blade" },
            -- })
            -- vim.lsp.enable("phpactor")

            -- clangd met override
            vim.lsp.config["clangd"] = vim.tbl_deep_extend("force", defaults, {
                on_attach = function(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false
                    on_attach(client, bufnr)
                end,
            })
            vim.lsp.enable("clangd")
        end,
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettierd" },
                    typescript = { "prettierd" },
                    lua = { "stylua" },
                    php = { "pint" },
                },
            })
        end,
    }
}
