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
opt.termguicolors = true -- enable 24-bit colors for the dms theme
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.sidescrolloff = 10

--search opts
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

--file opts
opt.swapfile = false
opt.undofile = true

--time opts
opt.updatetime = 250
opt.timeoutlen = 300

--completion opts
opt.completeopt = "menu,menuone,noselect,popup,fuzzy"
opt.pumheight = 10

--showmode opts
opt.showmode = false
opt.mouse = "a"

--list opts
opt.list = true
opt.listchars = { tab = "> ", trail = ".", nbsp = "␣" }
