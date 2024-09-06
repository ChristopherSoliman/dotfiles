return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)

        local telescope = require("telescope")
        telescope.setup({
            ["ui-select"] = {
                extension = {
                    require("telescope.themes").get_dropdown()
                }
            },
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    prompt_position = "top",
                    horizontal = {
                        mirror = false,
                    },
                    vertical = {
                        mirror = false,
                    },
                },
                selection_strategy = 'reset',
                sorting_strategy = 'ascending',
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
            },
        })
        telescope.load_extension("ui-select")
    end
}
