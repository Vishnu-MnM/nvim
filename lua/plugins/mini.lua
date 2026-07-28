vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' }, { load = true })

-- Adding needed plugins
-- Appearance
require("mini.icons").setup()
require("mini.animate").setup()
require("mini.cursorword").setup()
require("mini.indentscope").setup()
require("mini.notify").setup()
require("mini.starter").setup()
require("mini.statusline").setup({ use_icons = true })
require("mini.tabline").setup()
require("mini.trailspace").setup()

-- Mini.hipatterns
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE', 'BUFFER'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        buffer = { pattern = '%f[%w]()BUFFER()%f[%W]', group = 'MiniHipatternsBuffer' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})
-- Text Editing
require("mini.ai").setup()
require("mini.align").setup()
require("mini.comment").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
    snippets = {
        gen_loader.from_lang(),
    },
})

-- General Workflow
require("mini.basics").setup()
require("mini.bracketed").setup()
require("mini.bufremove").setup()
require("mini.extra").setup()
require("mini.files").setup()
require("mini.pick").setup()

-- Misc
require("mini.fuzzy").setup()

-- Changes to default vim
vim.notify = MiniNotify.make_notify()

-- Mini Clues
local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = { 'n', 'x' }, keys = '<Leader>' },

        -- `[` and `]` keys
        { mode = 'n',          keys = '[' },
        { mode = 'n',          keys = ']' },

        -- Built-in completion
        { mode = 'i',          keys = '<C-x>' },

        -- `g` key
        { mode = { 'n', 'x' }, keys = 'g' },

        -- Marks
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },

        -- Registers
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },

        -- Window commands
        { mode = 'n',          keys = '<C-w>' },

        -- `z` key
        { mode = { 'n', 'x' }, keys = 'z' },

        -- `s` key
        { mode = { 'n', 'x' }, keys = 's' },

        -- `a` key
        { mode = { 'n', 'x' }, keys = 'a' },
        { mode = { 'n', 'x' }, keys = 'i' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<leader>f", desc = "Find" },
        { mode = "n", keys = "<leader>s", desc = "Split" },
        { mode = "n", keys = "<leader>b", desc = "Buffer" },
        { mode = "n", keys = "<leader>d", desc = "Debug" },
        { mode = "n", keys = "<leader>l", desc = "LSP" },
        { mode = "n", keys = "<leader>D", desc = "Type Definition" },
        { mode = "n", keys = "gd",        desc = "Go to Definition" },
        { mode = "n", keys = "gD",        desc = "Go to Declaration" },
        { mode = "n", keys = "gr",        desc = "References" },
        { mode = "n", keys = "gI",        desc = "Go to Implementation" },
        { mode = "n", keys = "K",         desc = "Hover Docs" },
    },
})
