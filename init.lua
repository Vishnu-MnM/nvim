vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins.lspconfig")
require("plugins.mini")
require("plugins.treesitter")
require("plugins.dms")
require("config.options")
require("config.keymaps")
vim.cmd.colorscheme("dms")
