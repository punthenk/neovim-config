return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					extra_args = { "--config", vim.fn.expand("~/.config/nvim/utils/prettier-config/.prettierrc.json") },
				}),
				null_ls.builtins.diagnostics.eslint_d, -- Correcte import
			},
		})

		vim.keymap.set("n", "<leader>fd", function()
			vim.lsp.buf.format({ async = true })
		end, {})
	end,
}
