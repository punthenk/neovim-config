return {
    "tpope/vim-fugitive",
    opts = {},
    lazy = false,

    config = function ()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}
