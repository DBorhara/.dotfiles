local wezterm = require('wezterm')

-- Build config table safely for older versions
local config = wezterm.config_builder and wezterm.config_builder() or {}

-----------------------------------------------------------
-- 🎨 Colors
-----------------------------------------------------------
config.colors = {
	foreground = '#d6d6d6',
	background = '#1a1a1a',
	cursor_bg = '#a3c1da',
	cursor_border = '#a3c1da',
	cursor_fg = '#1a1a1a',
	selection_bg = '#44475a',
	selection_fg = '#ffffff',

	ansi = {
		'#2e2e2e',
		'#ffb3ba',
		'#baffc9',
		'#ffffba',
		'#bae1ff',
		'#e0bbff',
		'#b2fefa',
		'#dcdcdc',
	},

	brights = {
		'#4e4e4e',
		'#ff8b94',
		'#c2f9bb',
		'#ffffd1',
		'#b3ecff',
		'#dab6fc',
		'#c4fff9',
		'#f5f5f5',
	},
}

-----------------------------------------------------------
-- 🔤 Fonts
-----------------------------------------------------------
config.font = wezterm.font_with_fallback({
	'JetBrainsMono Nerd Font',
	'FiraCode Nerd Font',
	'Hack Nerd Font',
})
config.font_size = 20.0

-----------------------------------------------------------
-- 🪟 Window configuration (IMPORTANT FOR SLIDING)
-----------------------------------------------------------

-- ❗ MUST be normal window for Hammerspoon slide animation
config.window_decorations = 'RESIZE'
config.window_background_opacity = 1.0

-- Required so status line always shows
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 1

config.enable_scroll_bar = false
config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-----------------------------------------------------------
-- ⌨️ Keybindings
-----------------------------------------------------------
config.keys = {
	{
		key = 'f',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.ToggleFullScreen,
	},
}

-----------------------------------------------------------
-- ⚡ GEAR 5 STATUS BAR
-- Compatible with WezTerm 20240203 (your version)
-----------------------------------------------------------
wezterm.on('update-right-status', function(window, pane)
	---------------------------------------------------
	-- LEFT SIDE: Current working directory
	---------------------------------------------------
	local cwd_uri = pane:get_current_working_dir()
	local cwd = ''

	if cwd_uri then
		-- Convert URI/table to a string
		local uri = tostring(cwd_uri)

		-- Strip "file://"
		uri = uri:gsub('^file://', '')

		-- URL decode (%20 → space)
		cwd = uri:gsub('%%(%x%x)', function(hex)
			return string.char(tonumber(hex, 16))
		end)
	end

	window:set_left_status(wezterm.format({
		{ Foreground = { Color = '#9ccfd8' } },
		{ Attribute = { Intensity = 'Bold' } },
		{ Text = '  ' .. cwd .. '  ' },
	}))

	---------------------------------------------------
	-- RIGHT SIDE: GEAR 5 + timestamp
	---------------------------------------------------
	local date = wezterm.strftime('%Y-%m-%d %H:%M')

	local right = wezterm.format({
		{ Foreground = { Color = '#f6c177' } },
		{ Attribute = { Intensity = 'Bold' } },
		{ Text = '⚡  GEAR 5  ' },
		{ Attribute = { Intensity = 'Normal' } },
		{ Foreground = { Color = '#d6d6d6' } },
		{ Text = date .. '  ' },
	})

	window:set_right_status(right)
end)

-----------------------------------------------------------
return config
