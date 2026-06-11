local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("BufReadPost", {
    group = augroup("restore_cursor", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

autocmd("VimResized", {
    group = augroup("resize_splits", { clear = true }),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

autocmd("FileType", {
    group = augroup("close_with_q", { clear = true }),
    pattern = { "help", "qf", "man", "lspinfo", "checkhealth" },
    callback = function(event)
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
    end,
})

autocmd("BufWritePre", {
    group = augroup("auto_mkdir", { clear = true }),
    callback = function(event)
        local dir = vim.fn.fnamemodify(event.match, ":p:h")
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end,
})

autocmd({ "FocusGained", "BufEnter" }, {
    group = augroup("checktime", { clear = true }),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

local rn_group = augroup("relative_number_toggle", { clear = true })
autocmd("InsertEnter", {
    group = rn_group,
    callback = function() vim.opt.relativenumber = false end,
})
autocmd("InsertLeave", {
    group = rn_group,
    callback = function() vim.opt.relativenumber = true end,
})

autocmd("FileType", {
    group = augroup("prose_settings", { clear = true }),
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
