local wezterm = require('wezterm')

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
}

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
	window_background_image = '/Users/depakborhara/.cache/thumbnails/neofetch/luffy.png',
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
		},
	},

	set_environment_variables = {
		WEZTERM_ACTIVE = '1',
	},
}
