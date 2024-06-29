vim.opt.termguicolors = true
vim.cmd("colorscheme kanagawa")

-- Ranger.vim
vim.g.ranger_replace_netrw = 1
vim.g.ranger_map_keys = 0 -- remove default keymap and set them below
vim.keymap.set('n', '<leader>f', ':Ranger<CR>')

-- telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fn', ':Telescope find_files cwd=~/Documents/notes/<CR>')
vim.keymap.set('n', '<leader>fdot', ':Telescope find_files cwd=~/.config/<CR>')
vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>gf', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gn', ':Telescope live_grep cwd=~/Documents/notes/<CR>')
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
