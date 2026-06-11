vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { load = true })

require("nvim-treesitter").setup({
    ensure_installed = {
        "lua", "python", "rust", "go", "java",
        "javascript", "typescript", "tsx",
        "html", "css", "json", "yaml", "toml",
        "markdown", "markdown_inline",
        "bash", "vim", "vimdoc", "query",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})
