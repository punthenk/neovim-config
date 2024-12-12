return {
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup()
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      opts = {
         auto_install = true,
      },
      -- config = function()
      -- 	require("mason-lspconfig").setup({
      -- 		ensure_installed = {
      -- 			"lua_ls",
      -- 			"csharp_ls",
      -- 			"cssls",
      -- 			"html",
      -- 			"jsonls",
      -- 			"sqlls",
      -- 			"eslint",
      -- 		},
      -- 	})
      -- end,
   },
   {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
         local capabilities = require("cmp_nvim_lsp").default_capabilities()
         local lspconfig = require("lspconfig")

         lspconfig.lua_ls.setup({
            capabilities = capabilities,
         })
         lspconfig.csharp_ls.setup({
            capabilities = capabilities,
         })
         lspconfig.cssls.setup({
            capabilities = capabilities,
         })
         lspconfig.html.setup({
            capabilities = capabilities,
            filetypes = { "html", "ejs", "phpactor", },
         })
         lspconfig.jsonls.setup({
            capabilities = capabilities,
         })
         lspconfig.sqlls.setup({
            capabilities = capabilities,
         })
         lspconfig.eslint.setup({
            capabilities = capabilities,
         })
         lspconfig.ts_ls.setup({
            capabilities = capabilities,
         })
         lspconfig.phpactor.setup({
            capabilities = capabilities,
         })

         vim.keymap.set("n", "K", vim.lsp.buf.hover, {}, { desc = "Show the things of the keyword" })
         vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
         vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})
         vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
   },
}
