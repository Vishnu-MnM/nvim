vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { load = true, confirm = false})

require("nvim-treesitter").install { "bash", "go", "kdl", "lua", "markdown", "nu", "python", "rust", "sql", "toml", "yaml" }

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sh", "bash", "go", "kdl", "python", "nu", "rust", "sql", "toml", "yaml" },
    callback = function() vim.treesitter.start() end,
})
