vim.pack.add({
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/mxsdev/nvim-dap-vscode-js",
    "https://github.com/microsoft/vscode-js-debug",
}, { load = true, confirm = false })

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end

local map = vim.keymap.set
map("n", "<F5>",       dap.continue,          { desc = "Debug: continue" })
map("n", "<F10>",      dap.step_over,         { desc = "Debug: step over" })
map("n", "<F11>",      dap.step_into,         { desc = "Debug: step into" })
map("n", "<F12>",      dap.step_out,          { desc = "Debug: step out" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
map("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: conditional breakpoint" })
map("n", "<leader>dr", dap.repl.open,         { desc = "Debug: open REPL" })
map("n", "<leader>du", dapui.toggle,          { desc = "Debug: toggle UI" })

-- Python
dap.adapters.python = {
    type = "executable",
    command = vim.fn.expand("~/.local/share/uv/tools/debugpy/bin/python"),
    args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return vim.fn.exepath("python3") or "python3"
        end,
    },
}

-- Rust
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.exepath("codelldb"),
        args = { "--port", "${port}" },
    },
}
dap.configurations.rust = {
    {
        type = "codelldb",
        request = "launch",
        name = "Launch binary",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

-- JavaScript / TypeScript / React
require("dap-vscode-js").setup({
    debugger_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/vscode-js-debug",
    adapters = { "pwa-node", "pwa-chrome", "node", "chrome" },
})

local js_languages = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
for _, lang in ipairs(js_languages) do
    require("dap").configurations[lang] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-chrome",
            request = "launch",
            name = "Debug in Chrome",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
        },
    }
end

-- Go
dap.adapters.go = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.exepath("dlv"),
        args = { "dap", "-l", "127.0.0.1:${port}" },
    },
}
dap.configurations.go = {
    {
        type = "go",
        name = "Debug file",
        request = "launch",
        program = "${file}",
    },
    {
        type = "go",
        name = "Debug package",
        request = "launch",
        program = "${fileDirname}",
    },
}
