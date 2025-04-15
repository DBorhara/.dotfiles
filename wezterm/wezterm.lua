local wezterm = require("wezterm")

return {
    window_background_image = "/Users/depakborhara/.cache/thumbnails/neofetch/waifu1.jpg",
    color_scheme = "nightfox",
    default_prog = { "/bin/zsh", "-l" }, -- -l = login shell
    font_size = 16.0,
    font = wezterm.font("JetBrainsMono Nerd Font"),
    hide_tab_bar_if_only_one_tab = true,
    enable_scroll_bar = false,
    use_fancy_tab_bar = false,
    window_padding = {
        left = 8,
        right = 8,
        top = 6,
        bottom = 6,
    },
    keys = {
        {
            key = "n",
            mods = "CTRL|SHIFT",
            action = wezterm.action.SendString("nvim\n"),
        },
    },
    set_environment_variables = {
        WEZTERM_ACTIVE = "1",
    },
}
