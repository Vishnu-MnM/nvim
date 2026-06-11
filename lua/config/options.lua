local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = "split"

opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10

opt.mouse = "a"
opt.showmode = false

opt.list = true
opt.listchars = { tab = "> ", trail = ".", nbsp = "␣" }

opt.splitkeep = "cursor"
