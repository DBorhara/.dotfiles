-- Import the 'lsp-zero' module.
local lsp_zero = require("lsp-zero")

-- Define an on-attach function for the LSP client.
lsp_zero.on_attach(function(client, bufnr)
    -- Define the options for key mappings.
    local opts = { buffer = bufnr, remap = false }

    -- Go to the definition of the symbol under the cursor.
    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    -- Show hover documentation for the symbol under the cursor.
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    -- Search for a symbol in the current workspace.
    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    -- Open floating window with diagnostics for the current line.
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
    end, opts)
    -- Go to the next diagnostic item.
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
    end, opts)
    -- Go to the previous diagnostic item.
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, opts)
    -- Suggest code actions for the symbol under the cursor.
    vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)
    -- Show references of the symbol under the cursor.
    vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)
    -- Rename the symbol under the cursor.
    vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)
    -- Show function/method signature information in insert mode.
    vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)
end)

-- Basic setup for 'mason'.
require("mason").setup({})
-- Setup 'mason-lspconfig' with specified language servers.
require("mason-lspconfig").setup({
    ensure_installed = { "tsserver", "rust_analyzer" },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
    },
})

-- Setup for 'cmp' autocompletion.
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        -- Use file paths as a source for completion.
        { name = "path" },
        -- Use Neovim's built-in LSP as a source for completion.
        { name = "nvim_lsp" },
        -- Use Neovim's Lua API as a source for completion.
        { name = "nvim_lua" },
        { name = "copilot", group_index = 1, priority = 100 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        -- Move to the previous completion item.
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        -- Move to the next completion item.
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        -- Confirm the selected completion item.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- Trigger manual completion.
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})
