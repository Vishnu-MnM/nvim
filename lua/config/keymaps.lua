vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-s>", "<cmd>w<CR>",          { desc = "Save" })
map("i", "<C-s>", "<Esc><cmd>w<CR>",     { desc = "Save" })

map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

map("n", "<leader>sv", "<cmd>vsplit<CR>",    { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<CR>",     { desc = "Split horizontal" })
map("n", "<leader>sx", "<cmd>close<CR>",     { desc = "Close split" })
map("n", "<leader>se", "<cmd>wincmd =<CR>",  { desc = "Equal splits" })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n",     "nzzzv")
map("n", "N",     "Nzzzv")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "[b",         "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map("n", "]b",         "<cmd>bnext<CR>",     { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>",   { desc = "Delete buffer" })

map("n", "<leader>cd", "<cmd>cd %:p:h<CR>", { desc = "Change directory to file" })
