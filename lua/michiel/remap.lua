vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- keeps cursor at normal pos when J
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p')
vim.keymap.set("n", "<C-l>", ":nohl<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- Keeps latest yank in buffer

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>lf", function()
    require("conform").format({ lsp_fallback = true })
end)

vim.diagnostic.config({
    virtual_text = {
        source = true,
        format = function(diagnostic)
            return string.format("%s: %s", diagnostic.source, diagnostic.message)
        end,
    },
})

local function toggle_diagnostics_display()
    local current_config = vim.diagnostic.config()
    local is_enabled = current_config.virtual_text ~= false
    if is_enabled then
        vim.diagnostic.config({ virtual_text = false })
    else
        vim.diagnostic.config({
            virtual_text = {
                source = true,
                format = function(diagnostic)
                    return string.format("%s: %s", diagnostic.source, diagnostic.message)
                end,
            },
        })
    end
end

vim.keymap.set("n", "<leader>e", toggle_diagnostics_display)
