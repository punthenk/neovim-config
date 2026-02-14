return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local telescope = require('telescope')

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
                        ['<C-j>'] = 'move_selection_next',
                        ['<C-k>'] = 'move_selection_previous',
                        ['<Down>'] = 'move_selection_next',
                        ['<Up>'] = 'move_selection_previous',
                        ['<C-x>'] = 'delete_buffer',
                        ['<Esc>'] = 'close',
                    },
                    n = {
                        ['q'] = 'close',
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

        pcall(telescope.load_extension, 'fzf')
        -- local builtin = require('telescope.builtin')

        -- Keymaps
        -- vim.keymap.set('n', '<leader>ff', builtin.find_files)
        -- vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        -- vim.keymap.set('n', '<leader>fw', builtin.grep_string)
        -- vim.keymap.set('n', '<leader>fc', builtin.commands)
        -- vim.keymap.set('n', '<leader>fs', builtin.git_status)

        vim.keymap.set('n', '<leader>ff', function()
            require('telescope.builtin').find_files()
        end)

        vim.keymap.set('n', '<leader>fg', function()
            require('telescope.builtin').live_grep()
        end)

        vim.keymap.set('n', '<leader>fw', function()
            require('telescope.builtin').grep_string()
        end)

        vim.keymap.set('n', '<leader>fc', function()
            require('telescope.builtin').commands()
        end)

        vim.keymap.set('n', '<leader>fs', function()
            require('telescope.builtin').git_status()
        end)
    end
}
