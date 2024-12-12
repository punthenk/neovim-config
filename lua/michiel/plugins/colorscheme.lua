-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
--
-- 	config = function()
--
-- 		require("rose-pine").setup({
--
-- 			dark_variant = "moon", -- main, moon, or dawn
--
-- 			styles = {
-- 				bold = true,
-- 				italic = true,
-- 				transparency = true,
-- 			},
--
-- 			enable = {
-- 				terminal = true,
-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
-- 				migrations = true, -- Handle deprecated options automatically
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine")
--
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
-- 	end
--
-- }

-- return {
--   {
--     'maxmx03/dracula.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function ()
--       ---@type dracula
--       local dracula = require "dracula"
--
--       dracula.setup({
--       styles = {
--         Type = {},
--         Function = {},
--         Parameter = {},
--         Property = {},
--         Comment = {},
--         String = {},
--         Keyword = {},
--         Identifier = {},
--         Constant = {},
--       },
--       transparent = true,
--       on_colors = function (colors, color)
--         ---@type dracula.palette
--         return {
--           -- override or create new colors
--           mycolor = "#ffffff",
--           -- mycolor = 0xffffff,
--         }
--       end,
--       on_highlights = function (colors, color)
--         ---@type dracula.highlights
--         return {
--           ---@type vim.api.keyset.highlight
--           Normal = { fg = colors.mycolor }
--         }
--       end,
--       plugins = {
--         ["nvim-treesitter"] = true,
--         ["rainbow-delimiters"] = true,
--         ["nvim-lspconfig"] = true,
--         ["nvim-navic"] = true,
--         ["nvim-cmp"] = true,
--         ["indent-blankline.nvim"] = true,
--         ["neo-tree.nvim"] = true,
--         ["nvim-tree.lua"] = true,
--         ["which-key.nvim"] = true,
--         ["dashboard-nvim"] = true,
--         ["gitsigns.nvim"] = true,
--         ["neogit"] = true,
--         ["todo-comments.nvim"] = true,
--         ["lazy.nvim"] = true,
--         ["telescope.nvim"] = true,
--         ["noice.nvim"] = true,
--         ["hop.nvim"] = true,
--         ["mini.statusline"] = true,
--         ["mini.tabline"] = true,
--         ["mini.starter"] = true,
--         ["mini.cursorword"] = true,
--         ['bufferline.nvim'] = true,
--       }
--       })
--       vim.cmd.colorscheme 'dracula'
--       vim.cmd.colorscheme 'dracula-soft'
--     end
--   },
-- }

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},

  config = function()
    require("tokyonight").setup({
      -- use the night style
      style = "night",
      -- disable italic for functions
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end,
    })

    vim.cmd([[colorscheme tokyonight]])
  end,
}
