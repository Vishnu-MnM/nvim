vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd.colorscheme("default")
require("plugins.lspconfig")
require("plugins.mini")
require("plugins.treesitter")
require("config.options")
require("config.keymaps")
