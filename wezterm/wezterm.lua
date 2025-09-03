local wezterm = require('wezterm')
local colors = {
	foreground = '#d6d6d6', -- soft light gray
	background = '#1a1a1a', -- near black
	cursor_bg = '#a3c1da',
	cursor_border = '#a3c1da',
	cursor_fg = '#1a1a1a',
	selection_bg = '#44475a',
	selection_fg = '#ffffff',

	ansi = {
		'#2e2e2e', -- black (dim)
		'#ffb3ba', -- red (pastel)
		'#baffc9', -- green (pastel)
		'#ffffba', -- yellow (pastel)
		'#bae1ff', -- blue (pastel)
		'#e0bbff', -- magenta (pastel)
		'#b2fefa', -- cyan (pastel)
		'#dcdcdc', -- white (light gray)
	},

	brights = {
		'#4e4e4e', -- bright black (dark gray)
		'#ff8b94', -- bright red
		'#c2f9bb', -- bright green
		'#ffffd1', -- bright yellow
		'#b3ecff', -- bright blue
		'#dab6fc', -- bright magenta
		'#c4fff9', -- bright cyan
		'#f5f5f5', -- bright white
	},
}
--[[
local colors = {
	foreground = '#262626',
	background = '#1e1e2e',
	cursor_bg = '#ffaf00',
	cursor_border = '#ffaf00',
	cursor_fg = '#000000',
	selection_bg = '#ffe6b3',
	selection_fg = '#000000',

	ansi = {
		'#1c1c1c',
		'#ff5f5f',
		'#5fff87',
		'#ffd75f',
		'#5fafd7',
		'#ff87d7',
		'#00d7ff',
		'#e4e4e4',
	},

	brights = {
		'#444444',
		'#ff8787',
		'#87ffaf',
		'#ffffaf',
		'#87d7ff',
		'#ffafff',
		'#5fffff',
		'#ffffff',
	},
}]]

return {
	font = wezterm.font_with_fallback({
		'JetBrainsMono Nerd Font',
		'FiraCode Nerd Font',
		'Hack Nerd Font',
	}),
	font_size = 25.0,
	default_prog = { '/bin/zsh', '-l' },
	hide_tab_bar_if_only_one_tab = true,
	enable_scroll_bar = false,
	use_fancy_tab_bar = false,

	window_padding = {
		left = 8,
		right = 8,
		top = 6,
		bottom = 6,
	},

	-- 🌄 Background image
	--window_background_image = '/Users/depakborhara/.cache/thumbnails/neofetch/luffy.png',
	window_background_opacity = 0.8,
	text_background_opacity = 1.0,

	-- 🎨 Custom color palette
	colors = colors,

	keys = {
		{
			key = 'n',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.SendString('nvim\n'),
		},
		{
			key = 'Tab',
			mods = 'SHIFT',
			action = wezterm.action.SendString('\x1b[Z'),
			-- Send Shift + Tab to ensure it works when pressed.
		},
	},

	set_environment_variables = {
		WEZTERM_ACTIVE = '1',
	},
}
