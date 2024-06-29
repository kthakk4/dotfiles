vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- Intelligently ignore case when searching, search as you type
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Smoother navigation
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear after searching
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- fzf file path in insert mode
vim.keymap.set('i', '<c-x><c-f>', '<plug>(fzf-complete-path)')

-- Copy things to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Easier navigation between Vim splits
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Shortcuts when writing
vim.keymap.set('i', '<C-d>', '<C-r>=strftime("%F")<CR>') -- print current date in insert mode

-- Optimize netrw file explorer
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 2
vim.keymap.set('n', '<leader>e', ':Lexplore<CR>')

