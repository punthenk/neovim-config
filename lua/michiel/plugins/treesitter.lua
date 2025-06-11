return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "lua", "javascript", "html", "css" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,

            },
            indent = {
                enable = true
            },
        }
        --
        -- }
        -- vim.opt.smartindent = false
    end
}
