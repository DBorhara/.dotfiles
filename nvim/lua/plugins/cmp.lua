return {
    url = 'https://github.com/Saghen/blink.cmp.git',
    name = 'blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = true }, accept = { auto_brackets = { enabled = true } } },


        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
        require("blink-cmp").setup()
        local colors = {
            bg        = "#232136",
            fg        = "#e0def4",
            border    = "#393552",
            accent_bg = "#f6c177", -- 🍑 peachy-pink selection background
            accent_fg = "#232136", -- dark text on peach background
            subtle    = "#6e6a86",
            kind      = "#c4a7e7",
        }

        vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg, fg = colors.fg })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.accent_bg, fg = colors.accent_fg, bold = true })
        vim.api.nvim_set_hl(0, "PmenuBorder", { bg = colors.bg, fg = colors.border })
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.fg })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = colors.subtle, italic = true })
        vim.api.nvim_set_hl(0, "CmpItemKind", { fg = colors.kind })
    end
}
