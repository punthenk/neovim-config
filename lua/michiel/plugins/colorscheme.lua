return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            disable_background = true,
            dark_variant = "moon", -- main, moon, or dawn
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
            enable = {
                terminal = true,
                migrations = true, -- Handle deprecated options automatically
            },
        })
        vim.cmd("colorscheme rose-pine")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        -- Make completion menu opaque
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "#232136", fg = "#e0def4" }) -- Main menu background
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#44415a", fg = "#e0def4" }) -- Selected item
        vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#44415a" }) -- Scrollbar background
        vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#6e6a86" }) -- Scrollbar thumb
    end
}

-- return {
--     "nickkadutskyi/jb.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         require("jb").setup({transparent = true})
--         vim.cmd("colorscheme jb")
--     end,
-- }

-- return {
--     "lunarvim/templeos.nvim",
--
--     config = function ()
--         vim.cmd("colorscheme templeos")
--     end
-- }

-- return {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = true,
--
--     config = function()
--         require("gruvbox").setup({
--             terminal_colors = true, -- add neovim terminal colors
--             undercurl = true,
--             underline = true,
--             bold = false,
--             italic = {
--                 strings = false,
--                 emphasis = false,
--                 comments = false,
--                 operators = false,
--                 folds = false,
--             },
--             strikethrough = true,
--             invert_selection = false,
--             invert_signs = false,
--             invert_tabline = false,
--             inverse = true, -- invert background for search, diffs, statuslines and errors
--             contrast = "", -- can be "hard", "soft" or empty string
--             palette_overrides = {},
--             overrides = {},
--             dim_inactive = false,
--             transparent_mode = true,
--         })
--
--         vim.cmd("colorscheme gruvbox")
--     end
-- }

-- return {
--     "owickstrom/vim-colors-paramount",
--
--     config = function()
--         vim.cmd("colorscheme paramount")
--
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


-- return {
--     "vague2k/vague.nvim",
--
--     config = function ()
--         vim.cmd("colorscheme vague")
--     end
-- }

-- return {
--     "tjdevries/colorbuddy.nvim",
--
--     config = function()
--         local colorbuddy = require('colorbuddy')
--
--         -- Set up your custom colorscheme if you want
--         colorbuddy.colorscheme("my-colors")
--
--         -- And then modify as you like
--         local Color = colorbuddy.Color
--         local colors = colorbuddy.colors
--         local Group = colorbuddy.Group
--         local groups = colorbuddy.groups
--         local styles = colorbuddy.styles
--
--         -- Use Color.new(<name>, <#rrggbb>) to create new colors
--         -- They can be accessed through colors.<name>
--         Color.new('background', '#000000')
--         Color.new('foreground', '#eeede5')
--         Color.new('red', '#cc6666')
--         Color.new('purple', '#c01ab5')
--         Color.new('green', '#86fa9d')
--         Color.new('yellow', '#fde342')
--         Color.new('cyan', '#4af1e5')
--         Color.new('blue', '#5c5cff')
--         Color.new('lightBlue', '#58c6ea')
--
--         -- Set the actual background
--         Group.new('Normal', colors.foreground, colors.background)
--         Group.new('NormalFloat', colors.foreground, colors.background) -- Floating windows
--
--         -- Line numbers
--         Group.new('LineNr', colors.yellow, colors.background)         -- Regular line numbers
--         Group.new('CursorLineNr', colors.yellow, colors.background) -- Current line number
--
--         Group.new('Comment', colors.cyan, nil)
--         Group.new('String', colors.purple, nil)
--
--         -- Define highlights in terms of `colors` and `groups`
--         Group.new('@comment', groups.Comment)
--         Group.new('@string', groups.String)
--         Group.new('@keyword.type', colors.green, nil)
--         Group.new('@keyword', colors.green, nil)
--         Group.new('@keyword.conditional.php', colors.yellow, nil)
--         Group.new('@keyword.control', colors.yellow, nil)
--         Group.new('@keyword.return', colors.yellow, nil)
--         Group.new('@type', colors.foreground, nil)
--         Group.new('@type.definition', colors.foreground, nil)
--         Group.new('@number', colors.purple, nil)
--         Group.new('@function', colors.foreground, nil)
--         Group.new('@method', colors.foreground, nil)
--         Group.new('@class', colors.foreground, nil)
--
--         Group.new('Conditional', colors.yellow, nil)
--         Group.new('Repeat', colors.yellow, nil)
--
--         Group.new('@function.builtin', colors.lightBlue, nil)
--         Group.new('@method.builtin', colors.lightBlue, nil)
--         Group.new('@keyword.php', colors.lightBlue, nil)
--
--         Group.new('@lsp.type.namespace', colors.foreground, nil)
--         Group.new('@lsp.type.class', colors.foreground, nil)
--         Group.new('@namespace', colors.foreground, nil)
--
--         -- Define highlights in relative terms of other colors
--         Group.new('Error', colors.red:light(), nil, styles.bold)
--         Group.new('Hint', colors.blue, nil)
--
--         -- If you want multiple styles, just add them!
--         -- Group.new('italicBoldFunction', colors.green, groups.Function, styles.bold + styles.italic)
--
--         -- If you want the same style as a different group, but without a style: just subtract it!
--         -- Group.new('boldFunction', colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)
--     end
-- }
