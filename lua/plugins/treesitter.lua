vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { load = true, confirm = false })

local parsers = { "bash", "go", "kdl", "lua", "markdown", "nu", "python", "rust", "sql", "toml", "yaml" }
require("nvim-treesitter").install(parsers)

local filetypes = {}
for _, lang in ipairs(parsers) do
    vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(lang))
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function() vim.treesitter.start() end,
})
