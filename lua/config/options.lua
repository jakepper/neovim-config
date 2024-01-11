-- lua/config/options.lua

-- cursor
vim.opt.guicursor = "n-v-c:block,i:ver25"

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true;
vim.opt.smartcase = true;
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.iskeyword:append("-")

-- undo functionality
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- appearance
vim.opt.termguicolors = true

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- pane properties
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
