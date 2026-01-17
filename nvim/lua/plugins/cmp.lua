return {
	name = 'blink.cmp',
	url = 'https://github.com/Saghen/blink.cmp.git',
	dependencies = {
		{
			name = 'friendly-snippets',
			url = 'https://github.com/rafamadriz/friendly-snippets.git',
		},
	},
	version = '1.*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		signature = { enabled = true },
		keymap = {
			preset = 'enter',
		},
		appearance = {
			nerd_font_variant = 'mono',
		},
		completion = {
			documentation = { auto_show = false },
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
}
