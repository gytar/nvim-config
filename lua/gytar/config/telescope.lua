local telescope = require("telescope")
local builtin = require("telescope.builtin")
local keymap = vim.keymap

telescope.load_extension("fzf")

keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
