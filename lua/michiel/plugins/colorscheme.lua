-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     config = function()
--         require("rose-pine").setup({
--             disable_background = true,
--             dark_variant = "moon", -- main, moon, or dawn
--             styles = {
--                 bold = true,
--                 italic = true,
--                 transparency = true,
--             },
--             enable = {
--                 terminal = true,
--                 migrations = true, -- Handle deprecated options automatically
--             },
--         })
--         vim.cmd("colorscheme rose-pine")
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
--         -- Make completion menu opaque
--         vim.api.nvim_set_hl(0, "Pmenu", { bg = "#232136", fg = "#e0def4" }) -- Main menu background
--         vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#44415a", fg = "#e0def4" }) -- Selected item
--         vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#44415a" }) -- Scrollbar background
--         vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#6e6a86" }) -- Scrollbar thumb
--     end
-- }
-- -- return {
-- --     "nickkadutskyi/jb.nvim",
-- --     lazy = false,
-- --     priority = 1000,
-- --     opts = {},
-- --     config = function()
-- --         require("jb").setup({transparent = true})
-- --         vim.cmd("colorscheme jb")
-- --     end,
-- -- }

-- return {
--     "lunarvim/templeos.nvim",
--
--     config = function ()
--         vim.cmd("colorscheme templeos")
--     end
-- }

return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,

    config = function()
        require("gruvbox").setup({
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = false,
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        })

        vim.cmd("colorscheme gruvbox")
    end
}
