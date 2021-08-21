local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')
local config = require('telescope.config').values

require('telescope').setup{
    defaults = {
        file_sorter = sorters.get_fzy_sorter,
        file_previewer = previewers.vim_buffer_cat.new,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist,
            },
            n = {
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}
require('telescope').load_extension('fzf')

local opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap
set_keymap('n', '<leader>ff',
    [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
    opts)
set_keymap('n', '<leader>fg',
    [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]],
    opts)
set_keymap('n', '<leader>fb',
    [[<Cmd>lua require('telescope.builtin').buffers()<CR>]],
    opts)
set_keymap('n', '<leader>fh',
    [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]],
    opts)
