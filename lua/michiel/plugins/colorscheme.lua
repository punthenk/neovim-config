return {
	"rose-pine/neovim",
	name = "rose-pine",

	config = function()

		require("rose-pine").setup({

			dark_variant = "moon", -- main, moon, or dawn

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},
		})

		vim.cmd("colorscheme rose-pine")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	end

}


-- return {
--   "Mofiqul/vscode.nvim",
--
--   config = function()
--     -- Lua:
--     -- For dark theme (neovim's default)
--     vim.o.background = "dark"
--
--     local c = require("vscode.colors").get_colors()
--     require("vscode").setup({
--       -- Alternatively set style in setup
--       -- style = 'light'
--
--       -- Enable transparent background
--       transparent = true,
--
--       -- Enable italic comment
--       italic_comments = true,
--
--       -- Underline `@markup.link.*` variants
--       underline_links = true,
--
--       -- Disable nvim-tree background color
--       disable_nvimtree_bg = true,
--
--       -- Apply theme colors to terminal
--       terminal_colors = true,
--
--       -- Override colors (see ./lua/vscode/colors.lua)
--       -- color_overrides = {
--       --   vscLineNumber = "#FFFFFF",
--       -- },
--
--       -- Override highlight groups (see ./lua/vscode/theme.lua)
--       group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--       },
--     })
--     -- require('vscode').load()
--
--     -- load the theme without affecting devicon colors.
--     vim.cmd.colorscheme("vscode")
--   end,
-- }


-- return {
--   "EdenEast/nightfox.nvim",
--
--   config = function ()
--
--
--     vim.cmd("colorscheme carbonfox")
--   end
-- }
