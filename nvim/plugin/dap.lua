-- Debugger: nvim-dap + dap-ui
--   C / C++  -> lldb-dap (ships with Xcode Command Line Tools)
--   Java     -> java-debug-adapter via nvim-jdtls (after/ftplugin/java.lua)
--   Python   -> debugpy (Mason) via nvim-dap-python
-- Compile C with -g (and ideally -O0) so breakpoints and variables work.
--
-- Plugins are only put on the runtimepath at startup; the setup below runs
-- the first time you press a debug key, keeping startup fast.

vim.pack.add({
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/theHamsta/nvim-dap-virtual-text',
    'https://github.com/mfussenegger/nvim-dap-python',
}, { load = false })

local did_setup = false

local function setup()
    if did_setup then return end
    did_setup = true

    local dap, dapui = require('dap'), require('dapui')
    dapui.setup()
    require('nvim-dap-virtual-text').setup({}) -- show variable values inline

    -- Open the UI when a session starts, close it when the program ends.
    dap.listeners.after.event_initialized.dapui = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui = function() dapui.close() end
    dap.listeners.before.event_exited.dapui = function() dapui.close() end

    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DiagnosticWarn' })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticOk', linehl = 'Visual' })

    -- C / C++ (lldb-dap)
    local lldb_dap = vim.fn.trim(vim.fn.system({ 'xcrun', '-f', 'lldb-dap' }))
    dap.adapters.lldb = { type = 'executable', command = lldb_dap, name = 'lldb' }
    dap.configurations.c = {
        {
            name = 'Launch executable',
            type = 'lldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            args = function()
                local input = vim.fn.input('Arguments: ')
                return input == '' and {} or vim.split(input, ' ', { trimempty = true })
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
        {
            name = 'Attach to process',
            type = 'lldb',
            request = 'attach',
            pid = function() return require('dap.utils').pick_process() end,
        },
    }
    dap.configurations.cpp = dap.configurations.c

    -- Python (debugpy from Mason)
    local debugpy = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'
    if vim.uv.fs_stat(debugpy) then
        require('dap-python').setup(debugpy)
    end
end

-- Expose for other config (e.g. Java's on_attach)
_G.UserDapSetup = setup

-- Keys: each sets up dap on first use, then runs the action.
local function act(fn)
    return function()
        setup()
        fn(require('dap'), require('dapui'))
    end
end

local map = vim.keymap.set
map('n', '<leader>db', act(function(d) d.toggle_breakpoint() end), { desc = 'Debug: toggle breakpoint' })
map('n', '<leader>dB', act(function(d) d.set_breakpoint(vim.fn.input('Condition: ')) end),
    { desc = 'Debug: conditional breakpoint' })
map('n', '<leader>dc', act(function(d) d.continue() end), { desc = 'Debug: start / continue' })
map('n', '<leader>dn', act(function(d) d.step_over() end), { desc = 'Debug: step over (next line)' })
map('n', '<leader>di', act(function(d) d.step_into() end), { desc = 'Debug: step into' })
map('n', '<leader>do', act(function(d) d.step_out() end), { desc = 'Debug: step out' })
map('n', '<leader>dC', act(function(d) d.run_to_cursor() end), { desc = 'Debug: run to cursor' })
map('n', '<leader>dr', act(function(d) d.repl.toggle() end), { desc = 'Debug: toggle REPL' })
map('n', '<leader>dl', act(function(d) d.run_last() end), { desc = 'Debug: run last config' })
map('n', '<leader>du', act(function(_, ui) ui.toggle() end), { desc = 'Debug: toggle UI' })
map({ 'n', 'v' }, '<leader>de', act(function(_, ui) ui.eval() end), { desc = 'Debug: evaluate expression' })
map('n', '<leader>dq', act(function(d, ui) d.terminate(); ui.close() end), { desc = 'Debug: stop' })

-- F-keys (fn+F5 etc. on a MacBook)
map('n', '<F5>', act(function(d) d.continue() end), { desc = 'Debug: start / continue' })
map('n', '<F10>', act(function(d) d.step_over() end), { desc = 'Debug: step over' })
map('n', '<F11>', act(function(d) d.step_into() end), { desc = 'Debug: step into' })
map('n', '<F12>', act(function(d) d.step_out() end), { desc = 'Debug: step out' })
