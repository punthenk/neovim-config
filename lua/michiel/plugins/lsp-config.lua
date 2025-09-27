return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "lua_ls",
                "csharp_ls",
                "cssls",
                "html",
                "jsonls",
                "sqlls",
                "eslint",
                "phpactor",
            },
        },
        config = function()
        end,

    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
                "csharp_ls",
                "csharp_ls",
                "cssls",
                "tailwindcss",
                "jsonls",
                "sqlls",
                "eslint",
                "tsserver",
            }

            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end

            -- lua_ls met extra instellingen
            vim.lsp.config["lua_ls"] = vim.tbl_deep_extend("force", defaults, {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
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
                filetypes = { "html", "php", "blade", },
            }
            vim.lsp.enable("html")

            vim.lsp.config["phpactor"] = vim.tbl_deep_extend("force", defaults, {
                init_options = {
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                },
                filetypes = { "php", "html", "blade" },
            })
            vim.lsp.enable("phpactor")

            -- clangd met override
            vim.lsp.config["clangd"] = vim.tbl_deep_extend("force", defaults, {
                on_attach = function(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false
                    on_attach(client, bufnr) -- wel je eigen mappings nog meegeven
                end,
            })
            vim.lsp.enable("clangd")
        end,
    },

}
