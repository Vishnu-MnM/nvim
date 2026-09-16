vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" }, { load = true, confirm = false })

vim.lsp.enable({ "lua_ls", "ruff", "ty", "gopls", "rust_analyzer", "bashls", "golangci_lint_ls"})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = true },
})

vim.lsp.config("bashls", {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'bash', 'sh' }
})

vim.lsp.config("gopls", {
    filetypes = { 'go', 'gomod', 'gowork' },
    settings = {
        analyses = { unusedparams = true },
        staticcheck = true,
    },
})

vim.lsp.config('golangci_lint_ls', {
	cmd = {'golangci-lint-langserver'},
	root_markers = { '.git', 'go.mod' },
	init_options = {
		command = {
			'golangci-lint', 'run', '--output.json.path', 'stdout', '--show-stats=false', '--issues-exit-code=1'
		},
	},
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            completion = { enable = true },
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = "Disable",
                library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.config("ruff", {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    init_options = {
        settings = {
            configurationPreference = "editorFirst",
            lineLength = 100,
            fixAll = true,
            ["indent-width"] = 4,
            showSyntaxErrors = true,
            lint = {
                preview = true,
            },
            format = {
                backend = "internal",
                ["quote-style"] = "double",
                ["indent-style"] = "space",
                ["line-ending"] = "auto",
            },
        },
    }
})

vim.lsp.config("ty", {
    settings = {
        ty = {
            rules = {
                ["division-by-zero"] = "ignore",
                ["index-out-of-bounds"] = "ignore",
                ["possibly-unsolved-reference"] = "warn",
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

-- LSP Attach AutoCommand for all LSPs.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        -- Inlay hints display inferred types, etc.
        if client:supports_method("inlayHint/resolve") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
        -- Completion can be invoked via <C-x> and <C-o>. It displays a list of
        -- names inferred from the context. (e.g. method names, variables, etc)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, {})
        end
    end,
})

