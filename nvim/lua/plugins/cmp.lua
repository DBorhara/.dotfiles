return {
	name = 'blink.cmp',
	url = 'https://github.com/Saghen/blink.cmp.git',
	dependencies = {
		name = 'friendly-snippets',
		url = 'https://github.com/rafamadriz/friendly-snippets.git',
	},
	version = '1.*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		signature = { enabled = true },
		keymap = {
			preset = 'none',
			['<C-space>'] = {
				'show',
				'show_documentation',
				'hide_documentation',
			},
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<Tab>'] = { 'select_next', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'fallback' },
			['<CR>'] = { 'select_and_accept', 'fallback' },
			['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
		},
		appearance = {
			nerd_font_variant = 'mono',
		},
		completion = {
			documentation = { auto_show = true },
			accept = { auto_brackets = { enabled = true } },
		},
		sources = {
			default = {
				'lsp',
				'path',
				'snippets',
				'buffer',
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = 'prefer_rust_with_warning' },
	},
	opts_extend = { 'sources.default' },
	config = function(_, opts)
		require('blink-cmp').setup(opts)
		local colors = {
			bg = '#232136',
			fg = '#e0def4',
			border = '#393552',
			accent_bg = '#f6c177', -- 🍑 peachy-pink selection background
			accent_fg = '#232136', -- dark text on peach background
			subtle = '#6e6a86',
			kind = '#c4a7e7',
		}

		vim.api.nvim_set_hl(0, 'Pmenu', { bg = colors.bg, fg = colors.fg })
		vim.api.nvim_set_hl(
			0,
			'PmenuSel',
			{ bg = colors.accent_bg, fg = colors.accent_fg, bold = true }
		)
		vim.api.nvim_set_hl(
			0,
			'PmenuBorder',
			{ bg = colors.bg, fg = colors.border }
		)
		vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = colors.fg })
		vim.api.nvim_set_hl(
			0,
			'CmpItemMenu',
			{ fg = colors.subtle, italic = true }
		)
		vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = colors.kind })
	end,
}
