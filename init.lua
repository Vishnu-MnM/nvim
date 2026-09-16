vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd.colorscheme("catppuccin")
require("plugins.lspconfig")
require("plugins.mini")
require("plugins.treesitter")
require("config.options")
require("config.keymaps")
