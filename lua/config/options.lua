local opt = vim.opt

--misc
opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.splitkeep = "cursor" --Determine scroll behaviour when opening, closing or resizing horizontal splits.

--tabs&indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.breakindent = true

--aesthetics
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.sidescrolloff = 10

--search opts
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = "split"

--file opts
opt.swapfile = false
opt.backup = false
opt.undofile = true

--time opts
opt.updatetime = 250
opt.timeoutlen = 300

--search opts
opt.completeopt = "menu,menuone,noselect,popup,fuzzy"
opt.pumheight = 10

--showmode opts
opt.showmode = false
opt.mouse = "a"

--list opts
opt.list = true
opt.listchars = { tab = "> ", trail = ".", nbsp = "␣" }
