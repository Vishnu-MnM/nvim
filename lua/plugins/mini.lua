vim.pack.add({ "https://github.com/echasnovski/mini.nvim" }, { load = true })

require("mini.icons").setup()

vim.cmd.colorscheme("miniwinter")

require("mini.animate").setup()
require("mini.cursorword").setup()

require("mini.indentscope").setup({
    symbol = "│",
    options = { try_as_border = true },
})

require("mini.notify").setup()
vim.notify = MiniNotify.make_notify()

require("mini.starter").setup()
require("mini.statusline").setup({ use_icons = true })
require("mini.tabline").setup()
require("mini.trailspace").setup()

require("mini.ai").setup()
require("mini.comment").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

require("mini.bufremove").setup()
vim.keymap.set("n", "<leader>bd", function() MiniBufremove.delete() end, { desc = "Delete buffer" })

require("mini.diff").setup()
require("mini.bracketed").setup()

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "File explorer" })

require("mini.fuzzy").setup()
require("mini.extra").setup()

require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", function() MiniPick.builtin.files() end,          { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() MiniPick.builtin.grep_live() end,      { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", function() MiniPick.builtin.buffers() end,        { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", function() MiniPick.builtin.help() end,           { desc = "Help" })
vim.keymap.set("n", "<leader>?",  function() MiniExtra.pickers.keymaps() end,       { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fs", function() MiniExtra.pickers.lsp({ scope = "document_symbol" }) end, { desc = "Symbols" })

local miniclue = require("mini.clue")
miniclue.setup({
    triggers = {
        { mode = "n", keys = "<leader>" },
        { mode = "x", keys = "<leader>" },
        { mode = "n", keys = "g" },
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
        { mode = "n", keys = "<C-w>" },
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "n", keys = '"' },
        { mode = "i", keys = "<C-r>" },
    },
    clues = {
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<leader>f",  desc = "Find" },
        { mode = "n", keys = "<leader>s",  desc = "Split" },
        { mode = "n", keys = "<leader>b",  desc = "Buffer" },
        { mode = "n", keys = "<leader>d",  desc = "Debug" },
        { mode = "n", keys = "<leader>l",  desc = "LSP" },
        { mode = "n", keys = "gd",         desc = "Go to definition" },
        { mode = "n", keys = "gD",         desc = "Go to declaration" },
        { mode = "n", keys = "gr",         desc = "References" },
        { mode = "n", keys = "gI",         desc = "Go to implementation" },
        { mode = "n", keys = "K",          desc = "Hover docs" },
        { mode = "n", keys = "<leader>rn", desc = "Rename" },
        { mode = "n", keys = "<leader>ca", desc = "Code action" },
        { mode = "n", keys = "<leader>D",  desc = "Type definition" },
    },
})
