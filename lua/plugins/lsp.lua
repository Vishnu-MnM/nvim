vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        map("gd",         vim.lsp.buf.definition,                              "Go to definition")
        map("gD",         vim.lsp.buf.declaration,                             "Go to declaration")
        map("gr",         vim.lsp.buf.references,                              "References")
        map("gI",         vim.lsp.buf.implementation,                          "Go to implementation")
        map("K",          vim.lsp.buf.hover,                                   "Hover docs")
        map("<leader>rn", vim.lsp.buf.rename,                                  "Rename")
        map("<leader>ca", vim.lsp.buf.code_action,                             "Code action")
        map("<leader>D",  vim.lsp.buf.type_definition,                         "Type definition")
        map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format")
        map("<leader>ld", vim.diagnostic.open_float,                           "Diagnostic float")
    end,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
        },
    },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
})

vim.lsp.enable({
    "lua_ls",
    "ruff",
    "ty",
    "rust_analyzer",
    "gopls",
    "jdtls",
    "ts_ls",
})
