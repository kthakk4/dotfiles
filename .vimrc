" Set leader key
let mapleader = ' '

colorscheme sorbet

" Aways show status bar. Show mode in status bar
set laststatus=2
set ruler
set showmode

" Syntax highlighting
syntax on

" Line numbers and relative numbers
set number
set relativenumber

" Split window behavior
set splitright
set splitbelow

" Whitespace visibility
set list
set listchars=tab:\ \ ,trail:·,nbsp:␣

" Clipboard integration
set clipboard=unnamedplus

" Undo history
set undofile

" Highlight current line
set cursorline

" Minimum lines to scroll
set scrolloff=15

" Case-insensitive search with highlighting
set ignorecase
set smartcase
set hlsearch

" Smoother navigation
set signcolumn=auto

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Insert date
inoremap <C-d> <C-r>=strftime("%F")<CR>

