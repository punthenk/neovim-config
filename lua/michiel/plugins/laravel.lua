local thing =  {
    "adibhanna/laravel.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>la", ":Artisan<cr>", desc = "Laravel Artisan" },
        { "<leader>lc", ":Composer<cr>", desc = "Composer" },
        { "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
        { "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
    },
    config = function()
        require("laravel").setup({
            notifications = true, -- Enable/disable Laravel.nvim notifications (default: true)
            debug = true ,        -- Enable/disable debug error notifications (default: false)
            keymaps = true,       -- Enable/disable Laravel.nvim keymaps (default: true)
            sail = {
                enabled = true,           -- Enable/disable Laravel Sail integration (default: true)
                auto_detect = true,       -- Auto-detect Sail usage in project (default: true)
            },
        })
    end,
    lazy = false
}
return {}
