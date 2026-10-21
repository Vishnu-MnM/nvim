vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" }, { load = true, confirm = false })
vim.pack.add({ "https://github.com/nanotee/sqls.nvim" })

vim.lsp.enable({ "lua_ls", "ruff", "ty", "gopls", "rust_analyzer", "bashls", "golangci_lint_ls", "sqls" })

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = true },
})

vim.lsp.config("gopls", {
    filetypes = { 'go', 'gomod', 'gowork' },
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            hints = {
                assignVariableTypes = true,
                parameterNames = true,
            },
        },
    },
})

vim.lsp.config("ruff", {
    init_options = {
        settings = {
            configurationPreference = "editorFirst",
            lineLength = 100,
            fixAll = true,
            showSyntaxErrors = true,
            lint = {
                preview = true,
            },
        },
    }
})

vim.lsp.config("ty", {
    settings = {
        ty = {
            configuration = {
                rules = {
                    ["division-by-zero"] = "ignore",
                    ["index-out-of-bounds"] = "ignore",
                    ["possibly-unresolved-reference"] = "warn",
                },
            },
        },
    },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "crate",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
        },
    },
})

vim.lsp.config("sqls", {
    settings = {
        sqls = {
            connections = {
                {
                    driver = "sqlite3",
                    dataSourceName = vim.fn.expand("~/databases/main.db"),
                },
            },
        },
    },
    on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
    end,
})

-- LSP Attach AutoCommand for all LSPs.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        -- Inlay hints display inferred types, etc.
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
    end,
})
