vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<leader>cd", "<cmd>cd %:p:h<CR>", { desc = "Change directory to file" })

-- Mini Keybinds
map("n", "<leader>e", function() MiniFiles.open() end, { desc = "File Explorer" })
map("n", "<leader>ff", function() MiniPick.builtin.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() MiniPick.builtin.grep_live() end, { desc = "Live Grep" })
map("n", "<leader>fb", function() MiniPick.builtin.buffers() end, { desc = "Buffers" })
map("n", "<leader>fh", function() MiniPick.builtin.help() end, { desc = "Help" })
map("n", "<leader>fs", function() MiniExtra.pickers.lsp({ scope = "document_scope" }) end, { desc = "Symbols" })
map("n", "<leader>bd", function() MiniBufremove.delete() end, { desc = "Buffer Delete" })
map("n", "<leader>bn", "<cmd>enew <CR>", { desc = "Open new buffer" })
map("n", "<leader>ts", function() MiniTrailspace.trim() end, { desc = "Remove TrailSpace" })
map("n", "<leader>?", function() MiniExtra.pickers.keymaps() end, { desc = "Keymaps" })

--LSP Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local lmap = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        lmap("gd", vim.lsp.buf.definition, "Go to definition")
        lmap("gD", vim.lsp.buf.declaration, "Go to declaration")
        lmap("gr", vim.lsp.buf.references, "References")
        lmap("gI", vim.lsp.buf.implementation, "Go to implementation")
        lmap("K", vim.lsp.buf.hover, "Hover docs")
        lmap("<leader>rn", vim.lsp.buf.rename, "Rename")
        lmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
        lmap("<leader>D", vim.lsp.buf.type_definition, "Type definition")
        lmap("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format")
        lmap("<leader>ld", vim.diagnostic.open_float, "Diagnostic float")
    end,
})

--Navigation
map("n", "<C-j>", "<C-w>j", { desc = "Split up" })
map("n", "<C-k>", "<C-w>k", { desc = "Split down" })
map("n", "<C-l>", "<C-w>l", { desc = "Split right" })
map("n", "<C-h>", "<C-w>h", { desc = "Split left" })
