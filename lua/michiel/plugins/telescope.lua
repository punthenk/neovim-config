return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                prompt_prefix = '  ',
                sorting_strategy = 'ascending',
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        preview_width = 0.55,
                        results_width = 0.45,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                file_ignore_patterns = {
                    "node_modules",
                    "vendor",
                    "storage",
                    ".git/",
                    "public/storage",
                    "%.lock",
                },
                path_display = { "truncate" },
                dynamic_preview_title = true,
                winblend = 0,
                border = {},
                borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                color_devicons = true,
                set_env = { ['COLORTERM'] = 'truecolor' },
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                    '--hidden',
                    '--glob=!.git/',
                },
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<Down>'] = actions.move_selection_next,
                        ['<Up>'] = actions.move_selection_previous,
                        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                        ['<C-x>'] = actions.delete_buffer,
                        ['<Esc>'] = actions.close,
                    },
                    n = {
                        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                        ['<C-x>'] = actions.delete_buffer,
                        ['q'] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/' },
                },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end
                },
                buffers = {
                    sort_lastused = true,
                    mappings = {
                        i = {
                            ['<c-d>'] = actions.delete_buffer,
                        },
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    -- case_mode = "smart_case",
                },
            },
        })

        telescope.load_extension('fzf')

        -- Keymaps
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find word under cursor' })
        vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
        vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Git status' })
    end
}
